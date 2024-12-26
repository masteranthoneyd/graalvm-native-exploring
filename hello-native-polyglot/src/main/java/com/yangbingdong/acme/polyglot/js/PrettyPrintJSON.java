package com.yangbingdong.acme.polyglot.js;


import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.Value;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.stream.Collectors;

public class PrettyPrintJSON {
    public static void main(String[] args) {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String input = reader.lines()
                .collect(Collectors.joining(System.lineSeparator()));
        try (Context context = Context.create("js")) {
            Value parse = context.eval("js", "JSON.parse");
            Value stringify = context.eval("js", "JSON.stringify");
            Value result = stringify.execute(parse.execute(input), null, 2);
            System.out.println(result.asString());
        }
    }
}

<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step version="1.0" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:l="http://xproc.org/library"
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns:c="http://www.w3.org/ns/xproc-step"
    name="main">
    
    <p:input port="source" primary="true"/>
    <p:output port="result" primary="true">
        <p:pipe step="last-step" port="result"/>
    </p:output>   
    
    <p:import href="http://xmlcalabash.com/extension/steps/library-1.0.xpl"/>
    
    <p:add-xml-base relative="false"/>
    
    <p:xinclude fixup-xml-base="true" name="last-step"/>
    
</p:declare-step>

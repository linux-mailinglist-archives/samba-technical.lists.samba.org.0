Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 118E16169C1
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 17:53:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=s7Do+YqqJZrwu0I9uZtpegQw+jIAaNwYfndcQ/l49x0=; b=Fkeq0eacIgRbiOJcxM2kcrH0VV
	t3P5tcFKfH8FtTi9sUvd12NqiGAcTu68iPIY07J+OrcO7Uzfqpmq2k/1Hrm5oW6YIdRcuLPHlc/2r
	uukk2N1+DnMQe7rkh77rPMmMjxHGoSjLuY8wuTzup8H+7jfQG6N3+0fwl56k7tg6Ks+xS6mq77RoU
	giLtJvsRyHEetPH0Mm5LgMvxdIfFU08uxOgf0Js/fjM1ff0KegOJ02G6Y3ylMWdGKvM5jUjQUMypR
	joNDLbL4f1r+P/0WaGHf45NmBC6Nv4+LzxmVZ7aTf6R5e4asnGPxWHxkHaKZVaTqhpZQozVOitjj8
	6vmVTVYg==;
Received: from ip6-localhost ([::1]:58488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqGzG-00A4kx-Vi; Wed, 02 Nov 2022 16:53:11 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:57901) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqGzB-00A4ko-KE
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 16:53:08 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6A4284049A;
 Wed,  2 Nov 2022 19:53:03 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 24DFE3D3;
 Wed,  2 Nov 2022 19:53:07 +0300 (MSK)
Message-ID: <5f42aebe-c572-e686-b29d-dce05bf2314b@msgid.tls.msk.ru>
Date: Wed, 2 Nov 2022 19:53:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Bug#1022945: smbclient: ambiguous duplications in the
 smbclient(1) manpage
Content-Language: en-US
To: Patrice DUROUX <patrice.duroux@gmail.com>, 1022945@bugs.debian.org,
 samba-technical@lists.samba.org
References: <166694210264.3504927.11927218818268507176.reportbug@kappa2>
In-Reply-To: <166694210264.3504927.11927218818268507176.reportbug@kappa2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


28.10.2022 10:28, Patrice DUROUX wrote:
> Package: smbclient
> Version: 2:4.16.6+dfsg-5
> Severity: wishlist
> 
> Dear Maintainer,
> 
> The smbclient(1) manpage contains some multiple entries in the OPTIONS
> section regarding the SYNOPSIS list.
> 
> Here are the two detected cases:
> 
> 71:       -m|--max-protocol protocol
> 72-           This allows the user to select the highest SMB protocol level that smbclient will use to connect to the server. By default this is set to highest available SMB3
> and
> 259:       -m|--max-protocol=MAXPROTOCOL
> 260-           The value of the parameter (a string) is the highest protocol level that will be supported by the client.

samba manpages are generated. And this is interesting.

The first text above comes from docs-xml/manpages/smbclient.1.xml:

                 <term>-m|--max-protocol protocol</term>
                 <listitem><para>This allows the user to select the
                 highest SMB protocol level that smbclient will use to
                 connect to the server. By default this is set to..

And the second text comes from docs-xml/smbdotconf/protocol/clientmaxprotocol.xml:

   <samba:parameter name="client max protocol"
                  context="G"
                  type="enum"
                  function="_client_max_protocol"
                  enumlist="enum_protocol"
                  xmlns:samba="http://www.samba.org/samba/DTD/samba-doc">
   <description>
     <para>The value of the parameter (a string) is the highest
     protocol level that will be supported by the client.</para>
     ...

So it looks like smbclient.1.xml manpage lists *all* options available,
and also includes other files which lists some options which are referenced
by smbclient.1.xml. And it looks like the same applies to other manpages too.

I'm Cc'ing samba-technical@ with this.

Thanks,

/mjt


> 76:       -P|--machine-pass
> 77-           Make queries to the external server using the machine account of the local server.
> and
> 335:       -P|--machine-pass
> 336-           Use stored machine account password.
> 
> Moreover the entries in the OPTIONS section should be more consistent to the SYNOPSIS
> syntax. For instance, SYNOPSIS is:
> 
>         smbclient [-M|--message=HOST] [-I|--ip-address=IP] [-E|--stderr] [-L|--list=HOST] [-T|--tar=<c|x>IXFvgbNan] [-D|--directory=DIR] [-b|--send-buffer=BYTES]
>          [-t|--timeout=SECONDS] [-p|--port=PORT] [-g|--grepable] [-q|--quiet] [-B|--browse] [-?|--help] [--usage] [-d|--debuglevel=DEBUGLEVEL] [--debug-stdout]
>          [-s|--configfile=CONFIGFILE] [--option=name=value] [-l|--log-basename=LOGFILEBASE] [--leak-report] [--leak-report-full] [-R|--name-resolve=NAME-RESOLVE-ORDER]
>          [-O|--socket-options=SOCKETOPTIONS] [-m|--max-protocol=MAXPROTOCOL] [-n|--netbiosname=NETBIOSNAME] [--netbios-scope=SCOPE] [-W|--workgroup=WORKGROUP]
>          [--realm=REALM] [-U|--user=[DOMAIN/]USERNAME%[PASSWORD]] [-N|--no-pass] [--password=STRING] [--pw-nt-hash] [-A|--authentication-file=FILE] [-P|--machine-pass]
>          [--simple-bind-dn=DN] [--use-kerberos=desired|required|off] [--use-krb5-ccache=CCACHE] [--use-winbind-ccache] [--client-protection=sign|encrypt|off] [-V|--version]
>          [-c|--command=STRING]
> 
> and the entries in OPTIONS are (with the duplicates):
>         -M|--message NetBIOS name      <- =HOST
>         -p|--port port                 <- =PORT
>         -g|--grepable
>         -m|--max-protocol protocol     <- duplicated
>         -P|--machine-pass              <- duplicated
>         -I|--ip-address IP-address     <- =IP
>         -E|--stderr
>         -L|--list                      <- =HOST
>         -b|--send-buffer buffersize    <- =BYTES
>         -B|--browse
>         -t|--timeout <timeout-seconds> <- =SECONDS
>         -T|--tar tar options           <- =<c|x>IXFvgbNan
>         -D|--directory initial directory <- =DIR
>         -c|--command command string    <- =STRING
>         -?|--help
>         -d|--debuglevel=DEBUGLEVEL
>         -l|--log-basename=logdirectory <- =LOGFILEBASE
>         -V|--version
>         -R|--name-resolve=NAME-RESOLVE-ORDER
>         -O|--socket-options=SOCKETOPTIONS
>         -m|--max-protocol=MAXPROTOCOL
>         -n|--netbiosname=NETBIOSNAME
>         -W|--workgroup=WORKGROUP
>         -r|--realm=REALM
>         -U|--user=[DOMAIN\]USERNAME[%PASSWORD] <- / or \ ?
>         -N|--no-pass
>         -A|--authentication-file=filename
>         -P|--machine-pass
> 
> And as we can see, the SYNOPSIS set is much larger than that of OPTIONS.
> 
> Regards,
> Patrice
> 
> ps: I just used the following command to check: man smbclient | grep -n -A 1 '\-.|'
> https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/pkg-samba-maint



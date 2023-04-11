Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B75FC6DDCC6
	for <lists+samba-technical@lfdr.de>; Tue, 11 Apr 2023 15:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bGSJLEBUcqPRNTojuB6P1wSkddmqOMA1GeeY0snFySM=; b=pRGColcUhYY0cv6bLFdYDwsuSV
	TzB8272BXUVwB3SI7DMZy+8qqm4oxEr8fNShBitwMwi82Rcd6DqENMWcePqYosHi7PZMQKRHMgFX3
	SWJm1uPlexjG1FeiD851TftdA79Q+4u7Q4YpWIJ9yC0A8eUa3OCUG1SesvQXfYK6yLRwihRR+v4Nt
	4jFyQwSUQdi1jyxLB3DxAJ/QfXDdiKiaxHJ9YJnj6fbU8SHJwKQEjywRCoM2vYn+gQ/WbSBKlqoRP
	23uXxlqeVyIvZ3bWAxu282cZyWohoBfURxIl3gP3HD5wUchAEmbXwMalZhJkUIQ8IZ0iCccJKgNRz
	rygumTtQ==;
Received: from ip6-localhost ([::1]:33044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmEN7-000McS-NT; Tue, 11 Apr 2023 13:49:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52212) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmEN2-000McJ-M4
 for samba-technical@lists.samba.org; Tue, 11 Apr 2023 13:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=bGSJLEBUcqPRNTojuB6P1wSkddmqOMA1GeeY0snFySM=; b=T09Q77xOSQH+pgfw/8vKd4p/Dw
 tndeJLOpCRRWwBR/c818sm+8SvxceU5MjJ7jam/dXktMfrkDuMvbzxpmZJMddUH+eS54E6/EdjAkv
 b5utsEEnZE5tPhvzARdlEQTwPMAbRnEHleQMjca+B1fLikR5Yl8wf8TCzcsWCK8lHrB8ALLwh+iz8
 8iaXah7SHSjnDMeyF2MDhNW6Y8xV1w3qmD2lJ1+N8upu1sqNAzOb7oaxWqjVmTIC2kmfp3bfZZy91
 x43UhHVRAkJ66Wn9iSizCEN8vRSjsXO1mDWodHnEoRF+BUlm0Mp36DO5H24uEEDamw6D+hLza7i0g
 40FlYecznJn+aaRmVwF5llqvhoEBiL+79FZhTDIJi5rvJ02TfyWqbyr2mhP2LO/rAeymT2OOciqnj
 iRNqK1bY17c5KGBG7qNtkoZsYcJJHfgoWczRVD2PoVYwP9M1eSxAQIl7IqA+Un733R1QNnowY4aa2
 ENCGVJI7Cs+9FPC/XhcRU6Yr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmEN2-000T5h-Bv
 for samba-technical@lists.samba.org; Tue, 11 Apr 2023 13:49:16 +0000
Message-ID: <ebf9c5cb-eee5-6b15-586f-c4af0b2f01eb@samba.org>
Date: Tue, 11 Apr 2023 14:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Recent Samba (4.18.0+) winbind configuration ?
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <4203dcdd-5e9b-6708-5cdf-aec961f5f6a1@oracle.com>
In-Reply-To: <4203dcdd-5e9b-6708-5cdf-aec961f5f6a1@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 11/04/2023 13:32, Jiří Šašek - Solaris Prague via samba-technical wrote:
> Story begins when Samba 4.14.0 changed its VFS so we decided to skip 
> 4.14.x and also 4.15.x releases to bundle it on Solaris but various 
> problems were also with later releases and we were only fixing issues in 
> 4.13.0 . Currently (4.18.0) the situation can called be critical so I 
> focused on recent release.
> 
> winbindd is giving up and I think the key could be in log message:
> 
> [2023/04/11 11:28:53.090661,  5, pid=1525, effective(0, 0), real(0, 0), 
> class=winbind] ../../source3/winbindd/wb_lookupname.c:
> 52(wb_lookupname_send)
>    WB command lookupname start.
>    Search namespace 'smbsetup' and domain 'smbsetup' for name ''.
> 
> ...where "smbsetup" is my domain  ...and I have added core-dump here to 
> freeze the stack:
> 
> [2023/04/11 11:28:53.090780,  0, pid=1525, effective(0, 0), real(0, 0)] 
> ../../source3/lib/dumpcore.c:315(dump_core)
>    dumping core in /var/samba/log/cores/winbindd
> 
> 
> I went over such many frames of "tevent's" but I do not know where to 
> start evaluation. I only catch the (PIDL) generated code was 
> optimized-out by gcc (11.3.0) so I built the code with -O0 and now the 
> code is available.
> 
> In the mood of total madness I also tried ChatGPT which suspects my 
> smb.conf but answer on my question:
> 
> 
> Q:
> what was changed in idmap configuration in smb.conf between 4.13 and 4.18 ?
> 
> A:
> There have been some changes to the idmap configuration in Samba between 
> version 4.13 and 4.18, although they may not necessarily be related to 
> the issue you're experiencing.
> 
> One notable change is that in Samba 4.18, the idmap config parameter has 
> been deprecated in favor of the idmap_ldb parameter. This new parameter 
> uses an LDB backend for id mapping, which allows for better performance 
> and scalability than the previous tdb backend.
> 
> Another change is that the idmap config parameter in Samba 4.18 now 
> accepts a backend option, which allows you to specify the backend to use 
> for id mapping. The options are rid, ad, autorid, and autorid_compat.
> 
> The rid backend continues to be the default, which means that if you 
> don't specify a backend explicitly, Samba will use the RID algorithm to 
> generate UIDs and GIDs.
> 
> In summary, if you're upgrading from Samba 4.13 to 4.18, you may need to 
> update your smb.conf to use the new idmap_ldb parameter and specify a 
> backend if you're not using the default rid backend.
> 
> ....looks suspectably because I can not find "idmap_ldb" in man smb.conf 
> so I asked again:
> 
> Q:
> backend option of idmap config was available even in samba 4.0.0 smb.con 
> so what exactly has been changed in 4.18.0 ?
> A:
> Something went wrong. If this issue persists please contact us through 
> our help center at help.openai.com.
> 
> ...I do not want to push here the way how to shot-down the f'g ChatGPT 
> but I would like to know if something was really changed. I went through 
> the RELEASE NOTES and there is nothing directly concerns to idmap config 
> AFAIK
> 
> constraints:
> 
>   - net ads join works as usual include adding of "A" record to DNS
> 
>   - despite of successful join it looks DC can not be located:
> 
> [2023/04/11 11:28:53.083220,  1, pid=1525, effective(0, 0), real(0, 0), 
> class=rpc_parse] ../../librpc/ndr/ndr.c:490(ndr_print_
> function_debug)
>         wbint_PingDc: struct wbint_PingDc
>            in: struct wbint_PingDc
> [2023/04/11 11:28:53.083291,  1, pid=1525, effective(0, 0), real(0, 0), 
> class=rpc_parse] ../../librpc/ndr/ndr.c:490(ndr_print_
> function_debug)
>         wbint_InitConnection: struct wbint_InitConnection
>            in: struct wbint_InitConnection
>                dcname                   : *
>                    dcname                   : ''
> 
> ...so it really looks like a stupid mis-configuration issue of mine.
> 
> Google is silent on all my attempts to ask "him".
> 
> If someone have some good idea please share it with me.
> 
> Many thanks,
> Yura
> 

Yes, stop asking chatGTP, you have made my day by supplying me with 
proof that chatGPT is STUPID!!!

There is an idmap backend called idmap_ldb, but it is only used on a 
Samba AD DC, did you get that chatGPT ?

Please post on again, but this time on the samba mailing list, which is 
the correct place to discuss how to set up Samba.
Please also post your smb.conf and tell us what version of Samba you 
were using previously.

Rowland


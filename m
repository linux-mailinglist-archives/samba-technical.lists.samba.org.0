Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA5424007
	for <lists+samba-technical@lfdr.de>; Wed,  6 Oct 2021 16:25:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=txh1IywazoDllWyIMpzohUJ+hUVMWotNPAT271UwJ8g=; b=37rzLpe0bFmHadg+8/E2ZA6kgq
	XVtLSLO9uVgpHe0jv6GGs6NBdRWagnoft7g4B3lIcnXmrjq1hASop5M4AV2U2Cc0o4SDBwwtOxMva
	Ptb+AHHkieMks1AteNqjmh9oLeDSPrlQ/HLCsTYaoli8SoJdQSZJ9rrZTLDIA1emKxAcrAqT1j2z7
	qT6GvmPrK2GXZ9hMcj0jBIpa9Z/dUyiKlDeFbnoZjg71okF4+DXChCtFeOu4kAoxIlT7elkY1sKsY
	HRZ7itCiAvKvmGNXnoJf2ynwVAaSMEo9LbEJ17oUWDNfgwyiFr+IBtDuOABhqNVkYlKeoafjwvLP8
	4+NJFscw==;
Received: from ip6-localhost ([::1]:64064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mY7qb-004gEb-RI; Wed, 06 Oct 2021 14:24:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mY7qR-004gE3-6N; Wed, 06 Oct 2021 14:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=txh1IywazoDllWyIMpzohUJ+hUVMWotNPAT271UwJ8g=; b=ESykAdCczUIiO0Z/HH0CIuuPV+
 vKoPoPIvnlv0DvmCYknl5zh3FMUCDNINUGCuFCrCuoZcGxKBbTd9UAXVLaVS1xFcoeqETq9Nam6yr
 7y72pFLkjduFEFa0FSI/PV7ejgxf1ZybKoU8rf3HZA0dKNt1XePVzLGTJjn+VwtvLEH34PfYK+l3x
 P5vHBzlTjy+gO63yZEIl35aS/GeB2pVK56xa8SdgVQnAPJZW9YACn8m20uEgYGRzxJ22S5pKHTVlc
 I73+otUXZp9QaZMjW1ke9o2wUcjk9ZHNsJ3CjxBshh8YQno4h0AFuwUX2PjLyAAoaYt22nBstT8g1
 CfjlL0Cn3vojozQvIRNb1pGup8MljxLfIGpjCMORRLSmmpPW5/OpYvnNzWr6KJPxh+Hv7f4i36yFs
 fVesKYoCGLBzbopC+IYhFdcRlfshVlEnSnArTxzB8njeB8GmjKnuedKtRGDsVnUg1UPscYap9OOdP
 928luZCRvFnA/ggAX7TWls0m;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__ECDSA_SHA256__AES_256_GCM:256) (Exim)
 id 1mY7qQ-001qAI-IT; Wed, 06 Oct 2021 14:24:30 +0000
To: <samba@lists.samba.org>
References: <1b27a4a1-8f6c-f0f-85d2-6f8c0be8244@cojot.name>
In-Reply-To: <1b27a4a1-8f6c-f0f-85d2-6f8c0be8244@cojot.name>
Subject: RE: [Samba] Samba 4.14.8 compile failure on RHEL 8.4 (log attached)
 (fwd)
Date: Wed, 6 Oct 2021 16:24:30 +0200
Message-ID: <5D17E9E363DC486E8FC5964B4161BF87@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
Thread-Index: Ade6vd/6WD9uICWpQwONK7CZcxAs9A==
X-MimeOLE: Produced By Microsoft MimeOLE
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Vincent, 

Hm, i see same here and also in 4.15.0 and in 4.14.7 

If i google a bit on : 
- Unable to determine origin of type `struct cli_credentials 
Or 
- librpc/idl/auth.idl:107

I found way more messages on this on internet.
This might be a regression bug. 
It looks related to "docbook-xsl-stylesheets", this is something a dev must
look at. 


I just looked also at the 4.15 build. Same. 
[553/632] Processing librpc/idl/auth.idl
10:24:50 runner ' cd ../.. &&  CC="/usr/lib/ccache/gcc" /usr/bin/perl
pidl/pidl --quiet --header --ndr-parser --python --outputdir
bin/default/librpc/gen_ndr -- "librpc/idl/auth.idl" '
librpc/idl/auth.idl:122: warning: helper() is pidl-specific and deprecated.
Use `include' instead
librpc/idl/auth.idl:107: error: Unable to determine origin of type `struct
cli_credentials'
librpc/idl/auth.idl:107: error: Unable to determine origin of type `struct
cli_credentials'


I just stopped my running builder and rerunning a 4.17.7 to compair this. 
And.. 

[535/623] Processing librpc/idl/auth.idl
14:17:47 runner ' cd ../.. &&  CC="/usr/lib/ccache/gcc" /usr/bin/perl
pidl/pidl --quiet --header --ndr-parser --python --outputdir
bin/default/librpc/gen_ndr -- "librpc/idl/auth.idl" '
librpc/idl/auth.idl:122: warning: helper() is pidl-specific and deprecated.
Use `include' instead
librpc/idl/auth.idl:107: error: Unable to determine origin of type `struct
cli_credentials'
librpc/idl/auth.idl:107: error: Unable to determine origin of type `struct
cli_credentials'

Same.

So, i dont know where this is coming from.. 

Had an extra look on "error: " 
Resulting in : 
cat samba_4.14.7+dfsg-0.1focal1_amd64-2021-10-06T14:14:58Z.build|grep
"error:"
librpc/idl/auth.idl:107: error: Unable to determine origin of type `struct
cli_credentials'
librpc/idl/auth.idl:107: error: Unable to determine origin of type `struct
cli_credentials'
librpc/idl/winbind.idl:183: error: winbind_SamLogon: [out] argument
'validation' is not a pointer or array, skip client functions
source4/librpc/idl/irpc.idl:70: error: nbtd_information: [out] argument
'info' is not a pointer or array, skip client functions
source4/librpc/idl/irpc.idl:83: error: nbtd_getdcname: [out] argument
'dcname' is a pointer to type 'string', skip client functions
source4/librpc/idl/irpc.idl:91: error: nbtd_proxy_wins_challenge: [out]
argument 'num_addrs' is not a pointer or array, skip client functions
source4/librpc/idl/irpc.idl:113: error: kdc_check_generic_kerberos: [out]
argument 'generic_reply' is not a pointer or array, skip client functions
source4/librpc/idl/irpc.idl:159: error: smbsrv_information: [out] argument
'info' is not a pointer or array, skip client functions


cat samba_4.14.8+dfsg-0.1focal1_amd64-2021-10-06T08\:38\:22Z.build|grep
"error:"
librpc/idl/auth.idl:107: error: Unable to determine origin of type `struct
cli_credentials'
librpc/idl/auth.idl:107: error: Unable to determine origin of type `struct
cli_credentials'
librpc/idl/winbind.idl:183: error: winbind_SamLogon: [out] argument
'validation' is not a pointer or array, skip client functions
source4/librpc/idl/irpc.idl:70: error: nbtd_information: [out] argument
'info' is not a pointer or array, skip client functions
source4/librpc/idl/irpc.idl:83: error: nbtd_getdcname: [out] argument
'dcname' is a pointer to type 'string', skip client functions
source4/librpc/idl/irpc.idl:91: error: nbtd_proxy_wins_challenge: [out]
argument 'num_addrs' is not a pointer or array, skip client functions
source4/librpc/idl/irpc.idl:113: error: kdc_check_generic_kerberos: [out]
argument 'generic_reply' is not a pointer or array, skip client functions
source4/librpc/idl/irpc.idl:159: error: smbsrv_information: [out] argument
'info' is not a pointer or array, skip client functions

So, i dont know what's causing your problem. 
I've CC-ed the samba-technical list, there is something going on but i dont
know what. 

So far, 

Greetz, 

Louis



> -----Oorspronkelijk bericht-----
> Van: samba [mailto:samba-bounces@lists.samba.org] Namens 
> Vincent S. Cojot via samba
> Verzonden: woensdag 6 oktober 2021 15:34
> Aan: sambalist
> Onderwerp: [Samba] Samba 4.14.8 compile failure on RHEL 8.4 
> (log attached) (fwd)
> 
> 
> Hi all,
> 
> I wanted to update some 4.14.x rpms (currently at 4.14.7) to 
> 4.14.8 and I got a 
> new failure compiling 4.14.8 on RHEL8.4. 4.14.7, 4.14.6 and 
> below compile just 
> fine on the same build machine.
> The log shows:
> 
> [....]
> + LC_ALL=en_US.utf8
> + /usr/bin/make -O -j8
> [....]
> librpc/idl/auth.idl:107: error: Unable to determine origin of 
> type `struct 
> cli_credentials'
> librpc/idl/auth.idl:107: error: Unable to determine origin of 
> type `struct 
> cli_credentials'
> librpc/idl/winbind.idl:183: error: winbind_SamLogon: [out] argument 
> 'validation' is not a pointer or array, skip client functions
> source4/librpc/idl/irpc.idl:70: error: nbtd_information: 
> [out] argument 'info' 
> is not a pointer or array, skip client functions
> source4/librpc/idl/irpc.idl:83: error: nbtd_getdcname: [out] 
> argument 'dcname' 
> is a pointer to type 'string', skip client functions
> source4/librpc/idl/irpc.idl:91: error: 
> nbtd_proxy_wins_challenge: [out] 
> argument 'num_addrs' is not a pointer or array, skip client functions
> source4/librpc/idl/irpc.idl:113: error: 
> kdc_check_generic_kerberos: [out] 
> argument 'generic_reply' is not a pointer or array, skip 
> client functions
> source4/librpc/idl/irpc.idl:159: error: smbsrv_information: 
> [out] argument 
> 'info' is not a pointer or array, skip client functions
> 
> gcc: fatal error: Killed signal terminated program cc1
> compilation terminated.
> 
> Build failed
>   ->  task in 'python_spoolss.objlist' failed with exit 
> status 1 (run with 
> -v to display more information)
> make: *** [Makefile:7: all] Error 1
> [...]
> 
> Any ideas?
> 
> ,-*~'`^`'~*-,._.,-*~'`^`'~*-,._.,-*~'`^`'~*-,._.,-*~'`^`'~*-,.
> _.,-*~'`^`'~*-,
> Vincent S. Cojot, Computer Engineering. STEP project. 
> _.,-*~'`^`'~*-,._.,-*~
> Ecole Polytechnique de Montreal, Comite Micro-Informatique. 
> _.,-*~'`^`'~*-,.
> Linux Xview/OpenLook resources page 
> _.,-*~'`^`'~*-,._.,-*~'`^`'~*-,._.,-*~'
> http://step.polymtl.ca/~coyote  _.,-*~'`^`'~*-,._ 
> coyote@NOSPAM4cojot.name
> 
> They cannot scare me with their empty spaces
> Between stars - on stars where no human race is
> I have it in me so much nearer home
> To scare myself with my own desert places.       - Robert Frost
> 
> 
> -- 
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba
> 
> 



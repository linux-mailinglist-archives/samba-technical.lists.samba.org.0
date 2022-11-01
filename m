Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E2B614587
	for <lists+samba-technical@lfdr.de>; Tue,  1 Nov 2022 09:16:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Z10E2GUIxV1U6mpPvP01U5PaBHpMD6uOfEMIiysXTdI=; b=1YAK3OgF/q6yuiTPvd8W1zSVro
	gVGxU0DydzP0PFaxXEg8In7KC3kJSTHJkNNGAxYNOSV0QCa0KZ3Zck/efo3fM2BW/B8ttPDBkWwo3
	a0aOffthfL5PUa/nYzWJKR5mo79DN3IO8wxPVNSAsN2tqaARn8RwdxuMS/XUD75OdBp+/3xckST6y
	+tkSlmib3dVjR9ZgJKCwU4zGGRBo4Go90uW1A9AF3wBDITR5ZeHfLU54MqMBs5Vbn2Nh9Ral63JG9
	IApy2JvOdtDX39yenyuU/o9V7JLx5Ff7YyiTdnKqiu71Aw4wtBpJ5hHwKZKwusqLRaVxILhUS5QM9
	14/eUUFg==;
Received: from ip6-localhost ([::1]:57342 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opmQn-009ldc-O1; Tue, 01 Nov 2022 08:15:33 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41457) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opmQd-009ldT-E8
 for samba-technical@lists.samba.org; Tue, 01 Nov 2022 08:15:28 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7ED2A4000C;
 Tue,  1 Nov 2022 11:15:20 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id A658D3D3;
 Tue,  1 Nov 2022 11:15:24 +0300 (MSK)
Message-ID: <8753e50d-5041-ae56-8b94-acee48afd32a@msgid.tls.msk.ru>
Date: Tue, 1 Nov 2022 11:15:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: samba-libs: Possible policy violation (now with unnecessary
 soname bump libndr.so.2 => libndr.so.3)
Content-Language: en-US
To: Michael Stone <mstone@debian.org>, 1013259@bugs.debian.org,
 Andrew Bartlett <abartlet@samba.org>, =?UTF-8?Q?Pavel_Filipensk=c3=bd?=
 <pfilipen@redhat.com>, Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <165571437894.409869.15645128981524194043.reportbug@dhcp-1.rz.nm-ict.de>
 <d5dbe20a-592d-11ed-a0b8-0dc32809422e@msgid.mathom.us>
 <21220e0e-8c2c-f9ed-402f-6d95f1489d0b@msgid.tls.msk.ru>
 <C5F51D22-A00B-4165-966E-EA4724984304@debian.org>
 <165571437894.409869.15645128981524194043.reportbug@dhcp-1.rz.nm-ict.de>
 <d5341d49-8d32-9ec2-b78e-8fa2ab4ea0f0@msgid.tls.msk.ru>
 <3c737677-d905-2657-bad5-d00deaa73043@tls.msk.ru>
In-Reply-To: <3c737677-d905-2657-bad5-d00deaa73043@tls.msk.ru>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Control: tag -1 + upstream

Original context was at http://bugs.debian.org/1013259 , but whole thing *now*
has is about completely unnecessary soname bump of libndr in 4.17 due to debugging
refinements.

01.11.2022 11:07, Michael Tokarev wrote:
> 01.11.2022 10:59, Michael Tokarev wrote:
> ..
>> And this revealed one more issue here, now with samba 4.17.  Where, the
>> same libndr.so again, has changed soname from libndr.so.2 to libndr.so.3!
>>
>> And it looks like *this* is what you're talking about now, once 4.17 with
>> this new libndr.so.3 hits unstable.
>>
>> *Sigh*.
>>
>> So now, samba-libs breaks not only bullseye sssd-ad, but also *bookworm*
>> sssd-ad!
>>
>> So:
>>   samba-libs 4.13: libndr.so.1
>>   samba-libs 4.15: libndr.so.2
>>   samba-libs 4.17: libndr.so.3
>>
>> and this is what we're facing now, 4.16=>4.17 update breaks things again.
>> and this new breakage went unnoticed, and I knew nothing about the soname
>> change before this very moment.
>>
>> Andrew, can you share some info about the new 2=>3 soname bumb in 4.17?
>>
>> I wonder if we should provide old libndr.so.1 and libndr.so.2 interface
>> in samba-libs forever... this shouldn't be that difficult.
> 
> This has come in 7b9f87b877bd385e8cec893cd282d4b3fc00206d:
> 
> Author: Pavel Filipenský <pfilipen@redhat.com>
> Date:   Wed Jun 22 11:13:34 2022 +0200
> 
>      librpc:ndr: Update ndr_print_debug() and add macro NDR_PRINT_DEBUG_LEVEL
> 
>      Bumping the ABI to 3.0.0
> 
>      This is enhancement of NDR_PRINT_DEBUG macro with following new features:
> 
>      * debug level can be specified (NDR_PRINT_DEBUG always uses level 1)
>      * the trace header shows the location and function of the caller
>        instead of function 'ndr_print_debug', which is not really useful.
> 
>      Signed-off-by: Pavel Filipenský <pfilipen@redhat.com>
>      Reviewed-by: Andreas Schneider <asn@samba.org>
> 
> Is it not possible to keep the soname after this change?
> I'm reviewing the changes now..

And it is/was definitely possible and was even trivial to do.
The only real change there is:

-void ndr_print_debug(ndr_print_fn_t fn, const char *name, void *ptr);
+bool ndr_print_debug(int level, ndr_print_fn_t fn, const char *name, void *ptr, const char *location, const char *function);

In order to avoid soname bump, a new function should be created, say,
ndr_print_debug_level(), with a new signature, and old function will
become a trivial wrapper around the new one.  This way, only the single
new signature should be added to the ABI file, and that's it.

C'mon...  there's really no reason to bump the soname just to refine
debugging output..

I can produce a patch to do just that, so the ABI will become compatible
with previous releases. But what to do with samba-4.17.[012] which were
released with libndr.so.3 already?

I'll sure revert this patch to librpc/ABI/ in Debian (after refining
the ndr_print_debug stuff)...

Anyway, I'll submit both changes, and let's see how it goes.

Thanks,

/mjt


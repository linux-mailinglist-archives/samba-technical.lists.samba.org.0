Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE89B1D9F2
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 16:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iaUztr6gHas6stUyHR0KydIvegK9VgiaXvSMroTPDtU=; b=dOVG1L4p5da+ikI5JFBKGBL93q
	DNYF4k1Z1ieNI7LzfpOU96+EB+1Ld731ngQFCBhSjSMpiCNWHep9qnbqCBxxRxSKimYP9+7agI3j0
	/k/vlSYOGE27zzYDFqqs1bZs9/1XosYJOAMfVuh81exNiJhKCpFuVgUln/9vKwNOutNQe7RZa8gNp
	3od8T8I6JxzYnWdHfkYHze8rspQ9BT5hueXDr+tbBuA+aRawuoYqqjtyc2+4QpsJj2gJ6hXQqlTU8
	Uf7lFuL/AR1vYXaBK6qDPQDSfd9OXRaaE06pULvhqQkEx+nI8GOBytqdJwENlDh5gpBeL+Es6bz9f
	hCxshkFA==;
Received: from ip6-localhost ([::1]:30150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk1av-00EWxC-0t; Thu, 07 Aug 2025 14:27:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21906) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk1aq-00EWx1-7O
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 14:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=iaUztr6gHas6stUyHR0KydIvegK9VgiaXvSMroTPDtU=; b=Vqo4DixERx+lnPS0I+NcIdGgZT
 cYm4FqyqE0o/bjvY/YElCLl5gq0o0hDlc8X+ohBWxcYwSp3GseCXDAVXuINlix7xc7gVgpbkSvfxw
 fbih7BMEW3FpvcYN2H6W+0OImgmRuhB23Kunugnbv0y9z5Wqi1sPO/OEBEHq3S/D5NHd7xqRnnCR1
 Uf+/t/NqlglLlDLzkvAR+tRF5tGJ9MlqerX5zhEUXPE4Ml4Gtv+TWWNbygu/DMutmM59l3yUoIlfq
 RASH/nhO3TfnJSnFyT7DQTiPcXTmedH98XOx0RjA3fyxzLQVHQnNw/oKIwEFAXOf9j5fSyblvYyGa
 cBZvsR9zP8bwr0j6CqG3L02uaSU/aKhgnv1lBTtffZ6/s63Op9gjZ8+z6r5vzmgMqTTCByh2lazqK
 QpKRjR/mZ/9/wJ5QMEpurYLohKV8xrQH8l0msxm5J2Sj6ZEqWUVH4KldGTG9iktJuWUmLdLWspWko
 71cv+twR2or1UM8MXQdiGPI7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk1ao-001ayG-1j; Thu, 07 Aug 2025 14:27:42 +0000
Message-ID: <aa65df64-68f1-47bb-ab69-9817387f3ab8@samba.org>
Date: Thu, 7 Aug 2025 16:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Using smatch and sparse together (Re: [PATCH next] smb: client:
 Fix use after free in send_done())
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <aJNASZzOWtg8aljM@stanley.mountain>
 <ad2e9d94-2d95-4351-b800-627f20672209@samba.org>
 <87646c67-78b8-41c5-9b72-361cb3b733d1@suswa.mountain>
 <e291d925-bfd9-4202-b5d4-de5bf30ab870@samba.org>
 <a1a0046c-f47f-4e8a-ae3c-85db58a6cb2f@suswa.mountain>
 <df4905fb-933e-4055-8363-d6427515773b@samba.org>
 <d3b63d25-1b03-4c7c-85cc-efd9d74c3a8a@suswa.mountain>
Content-Language: en-US
In-Reply-To: <d3b63d25-1b03-4c7c-85cc-efd9d74c3a8a@suswa.mountain>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 07.08.25 um 09:22 schrieb Dan Carpenter:
> On Thu, Aug 07, 2025 at 08:34:09AM +0200, Stefan Metzmacher wrote:
>> Am 06.08.25 um 16:39 schrieb Dan Carpenter:
>>> On Wed, Aug 06, 2025 at 04:17:41PM +0200, Stefan Metzmacher wrote:
>>>>>> What was the test that triggered the problem?
>>>>>> Or did you only noticed it by looking at the code?
>>>>>
>>>>> This was a Smatch static checker warning.  You need to have the cross
>>>>> function DB to detect it.
>>>>
>>>> Ok, I'll try to integrate it into my build flow...
>>>>
>>>> Does it replace sparse or does it run in addition?
>>>
>>> In addition.  I find the Sparse endianness checks especially useful.
>>>
>>>> If it replaces sparse I guess a small script would
>>>> run them both?
>>>>
>>>> $ cat mychecker.sh:
>>>> #!/bin/bash
>>>> set -e
>>>> sparse $@
>>>> smatch $@
>>>>
>>>> And maybe all others from
>>>> https://gautammenghani.com/linux,/c/2022/05/19/static-analysis-tools-linux-kernel.html
>>
>> I'm using this now:

This seems to work for me now:

$ cat custom-checker.sh
#!/bin/bash

set -e

which sparse > /dev/null 2>&1 && {
         sparse -Winit-cstring -Wsparse-error -fdiagnostic-prefix=SPARSE $@
}

which smatch > /dev/null 2>&1 && {
         smatch -p=kernel --pedantic --succeed $@
}

$ cat build-fs-smb.sh
#!/bin/bash
#

set -ueo pipefail

make modules_prepare
make -j16 M=fs/smb CF=-D__CHECK_ENDIAN__ W=1ce C=1 KBUILD_MODPOST_WARN=1 KCFLAGS="-Wfatal-errors" CHECK="$(pwd)/custom-checker.sh" $@ 2>&1 | tee build-fs-smb.out

cat build-fs-smb.out | grep -v 'parse error: Function too hairy' | grep -q 'error:' || {
         rm build-fs-smb.out
         exit 0
}
echo ""
echo "BUILD-ERRORS:"
cat build-fs-smb.out | grep -v 'parse error: Function too hairy' | grep 'error:'
find fs/smb -name '*.o' | xargs rm
find fs/smb -name '*.ko' | xargs rm
rm build-fs-smb.out
exit 1


> The DB is too big and too dependent on your .config but I should
> share the smatch_data/ more regularly.  I started to push that into
> a separate git repo but I didn't finish that work.  I should do
> that.

Ok, what's the gain of updating it?
Does it help when doing fixes on old kernels?

I'm typically doing a full kernel build a week after each rc.
My idea was to rebuild the whole db after doing that.

Thanks!
metze


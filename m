Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6777CEDC6
	for <lists+samba-technical@lfdr.de>; Thu, 19 Oct 2023 03:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=kwc84lLFUNsg1irneLtxPE5zVUblKCkZyFHKLpUEeoI=; b=Gj8lA3Ek7Tl2mFvhm/MMQMPrKB
	AAVVV4Q2GZasZVCfuTep1Q0EVv3yfpd4NiOoAX58xpmQztBu7+VHb+mlScLUS9kveWwGCLDggdjsp
	exeLYtcrxOe/t3BaC5FIzH0twW4bIrHQL/de5xeAAYSWEzXWmalYZAog4MbEnZu/WCFColOx5gS4Y
	rBIbuDtwwRjXL84yRu8jtTA2knrKr4yN+hQOCejaWMwO5NVoEnyzBCj67OjronT9/5RcTLlwwuek4
	rpz0eZRhE1L/RxcVShw8xZNLX/MdtSIMG0w0X8qRYlYC7FGOWEhl98dpD6k/inSgq/ougTOoMZh6j
	1clLPe/Q==;
Received: from ip6-localhost ([::1]:18030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtIFN-0019wW-P3; Thu, 19 Oct 2023 01:54:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57272) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qtIFJ-0019wN-2I
 for samba-technical@lists.samba.org; Thu, 19 Oct 2023 01:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=kwc84lLFUNsg1irneLtxPE5zVUblKCkZyFHKLpUEeoI=; b=s73jn9FJoiCCddoADW1ayHi6r0
 mUwTbHeKWKJRFFiaKmAo1mQWDt0cHKitlgX5YMOn2WQAb9FcwbsjgsOT1zNqFdRo7MvezxTowgg0/
 XPmyBnODGQIiVQkbjUxmQEbB2SbouhEReZrWiDy+8cP5PYn60p8uoBWGY0qjRsartDiYNPXrEZCZv
 H/UGiQ/bAI324mWVV5UR/uw2zY6//Dq8SMcPsj2j8ix6ccyrdfiUkD0+a75HlbudN6FU81s8McJc8
 Jv07NvFr0acJPEBgpgAk7lLzhNVVFcqoepiuixs6OINeWXWFDra3sCzyEwfwVD1aJGMinAcODrB6h
 lD6aSwXsqiNwtO5jhhkSYWuDvgzFntgKVytY5WOOxf9YGAS0bEudx4qTdEIsM/g0bkT+MBT4VKgP6
 xi8/F99vDel+P1127M9qLkv9Dz+AsqORr3KuEzNXNeIQi9uq754qD/LU4eGWdbXNB3Rdwz44B5AH4
 TsOybxzuUV2Z+jSTCGEsaIov;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qtIFI-001OWN-0u for samba-technical@lists.samba.org;
 Thu, 19 Oct 2023 01:54:44 +0000
Message-ID: <00f9d78e-01c6-4bad-a627-42adb3870fa2@samba.org>
Date: Thu, 19 Oct 2023 14:54:38 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: s4:torture: Increase multichannel timeout
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <E1qsqak-005Ezi-2G@hrx0.samba.org> <5999563.lOV4Wx5bFT@magrathea>
In-Reply-To: <5999563.lOV4Wx5bFT@magrathea>
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 18/10/23 7:28 pm, Andreas Schneider via samba-technical wrote:
> On Tuesday, 17 October 2023 22:23:02 CEST Andrew Bartlett wrote:
>> The branch, master has been updated
>>         via  f392fdfd47f shadow_copy2: Add missing TALLOC_FREE
>>         via  c6d0df787a1 s4:torture: Increase multichannel timeout
> 
> Hi,
> 
> I've increased the timeout which worked for me and the test didn't run into
> timeouts anymore. However Joseph run into the issue again with
> 
> https://gitlab.com/samba-team/devel/samba/-/jobs/5316200327
> 
> Does it make sense to further increase the timeout or could there be another
> issue. I'm not an expert in this area of the code.
> 
> https://gitlab.com/samba-team/samba/-/commit/
> c6d0df787a1f6007e1f4594f68ff1f75a46bd293
> 

Here’s some more detailed output from a failed run:
https://gitlab.com/samba-team/devel/samba/-/jobs/5324774640

Testing for BUG 15346
2023-10-19T01:09:58.811178Z: conn[0]: negprot done
2023-10-19T01:09:58.811246Z: conn[3]: negprot done
2023-10-19T01:09:58.811290Z: conn[5]: negprot done
[…]
2023-10-19T01:09:58.883395Z: conn[30]: echo done
2023-10-19T01:11:31.861815Z: conn[3]: echo timed out
UNEXPECTED(failure): samba3.smb2.multichannel.bugs.bug_15346(nt4_dc)
REASON: Exception: Exception: 
../../source4/torture/smb2/multichannel.c:2474: status was 
NT_STATUS_IO_TIMEOUT, expected NT_STATUS_OK: smb2cli_echo_recv failed

Connection 3 took just over 93 seconds to time out. 93 happens to be 
equal to ‘state->num_conns * 3’, the current timeout value in seconds.

So it would appear that the failure is indeed due to this timeout. But 
when the timeout is so long already, I don’t think that increasing it 
further is going to help.

Regards,
Joseph


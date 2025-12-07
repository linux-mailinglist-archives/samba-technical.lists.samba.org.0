Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59236CABAA5
	for <lists+samba-technical@lfdr.de>; Mon, 08 Dec 2025 00:10:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=qY/kHOyCvgJffH1Pebi2ZKnNbi2ZGZgi/gfZUcLMv9o=; b=DEFTdhFbf4mtfrBuU1W9WHjATK
	DE6O3FXKcgpYg66aashH6JfXr9fAIJRg/YQ4/jONs/tAKa3HKg5S4YzfV2sB00hzyGe08YqTfMNbl
	aH0r5wRfbmLEhoFTRh7MW2q9t2IX/UjQlo2XUzHxJLHH9L12CreGtQDL6Zznej0HRjAB4/S1jNzJt
	ZPBL1y03PRQ7ggs3GJ3WtSExfHJlcvQ1Z9IwnvJ9rwMFdO+UFBIpRqGsSFirTcsMOWfPajjYn/SDp
	mDXvgQB6haVFTJidtIwFfg/1iVm/klCj9Ft/70b2MaP1hdd9tRm/Hd8iENfH9ylDtUH7AaZdqKB0z
	x3i9oVKA==;
Received: from ip6-localhost ([::1]:56298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vSNsw-00FraD-V7; Sun, 07 Dec 2025 23:09:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10884) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vSNsq-00Fra6-Dm
 for samba-technical@lists.samba.org; Sun, 07 Dec 2025 23:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=qY/kHOyCvgJffH1Pebi2ZKnNbi2ZGZgi/gfZUcLMv9o=; b=3n+blOW8aO0dRxqxXAde5qGPEM
 H0Hto/p8vACK78Ko8k5ntDqYngnKhTAAZBN8J3sbzfwcsXzv3nnKgSwVhN0GxAUAGQ0IAf5ESJ9F3
 97IIWrant0qmLuJIPEefA0e3LEj2gBIbnA6xXxMB33BGmdhio4oejlXp9nmOsf8AmSHq+pVLQ9gwL
 Uu+JtWTHxcI0B7uZ8RglvlfM2NrA1e5+v2oo613tmCE+Y+RuNj/E/cxBeS1gJRRbExEfCGXuqekWl
 FzlcMjKuNR1PuCYxUZA8Rn7H7fjq4NxnW8Z2J0Ys+LSsIse1YLZGHW9a2MOYTok10U9oVzz5mTolu
 ix74X9HmDoPX6TE2w2ddYmawPfi7eIqF6GAGAJyUqoU0lzZZ8KjH1fBYyF5hfJRlraAT62nYzOsol
 mFZRTP+veHjaQaNyVioZb3SrMpt0WCcZG5w0v2Q4Jd2HVovEEfLj3xbiXTOCbvFjeSQSuD/jl4oOT
 coQ7K7Ss2RYI/q/zQinU/yfi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__ECDSA_SHA256__CHACHA20_POLY1305:256) (Exim)
 id 1vSNsp-00HJ9Y-0L; Sun, 07 Dec 2025 23:09:39 +0000
Subject: Re: How does the SMB handshake work?
To: JPT <j-p-t@gmx.net>, samba-technical@lists.samba.org
References: <4c26f3d5-31ad-4932-b02b-7521855dbaff@gmx.net>
Message-ID: <b8e60d39-b68e-5a73-b75d-7790062789e8@samba.org>
Date: Sun, 7 Dec 2025 17:09:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4c26f3d5-31ad-4932-b02b-7521855dbaff@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: "Christopher R. Hertel via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Christopher R. Hertel" <crh@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello.

Are you familiar with Microsoft's Open Specifications docset?  The
particular document you're looking for is [MS-SMB2].
  [MS-SMB2]:
https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/5606ad47-5ee0-437a-817e-70c366052962

See:
* [MS-SMB2; 2.2.31.4] VALIDATE_NEGOTIATE_INFO Request

https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/261ec397-d692-4e3e-8bcd-c96ce02bb969
* [MS-SMB2; 3.3.5.15.12] Handling a Validate Negotiate Info Request

https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/0b7803eb-d561-48a4-8654-327803f59ec6

Those will be good starting points.

If I recall correctly (and I haven't looked at this exchange in a while),
this exchange is used following the negotiation of protocol parameters and
behaviors.  It is a secured exchange, allowing the client and server to
verify what was negotiated and assure one another that there is no
man-in-the-middle downgrading the security of the connection.

Chris -)-----

On 12/7/25 11:31 AM, JPT via samba-technical wrote:
> Hi,
> 
> I am currently implementing a SMB-Server using
> https://github.com/TalAloni/SMBLibrary
> 
> I am slowly getting to a working server.
> 
> But Samba client tries to negotiate the features and I just cannot find any
> information on what is going on.
> 
> samba sends:
> 
> INTFileStore.DeviceIOControl(handle=(null), ctlCode=0x140204(devicetype=14,
> accessmode=0, function=81),inputLength=28, maxOutputLength=24)
> 
> the input buffer contains:
> FSCTL_VALIDATE_NEGOTIATE_INFO request parsed: StructSize=0, DialectCount=0,
> ClientSecMode=0xBE4D, ClientCaps=0x48F4C728,
> ClientGuid=2a997584-1896-3636-0100-020002021002, Dialects=[]
> 
> How do I find out what this actually means?
> 
> The AI created an example output array, but it needs 28 bytes, while Samba
> only gives 24.
> The AI says it's called SMB2_VALIDATE_NEGOTIATE_INFO_RESPONSE but I just
> cannot find anything on this name or how the output array should look like.
> 
> Samba does not increase the buffer size, instead it just tells
> tree connect failed: NT_STATUS_BUFFER_TOO_SMALL
> 
> any help appreciated.
> 
> JPT
> 
> 


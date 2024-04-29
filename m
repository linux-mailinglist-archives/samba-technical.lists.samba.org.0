Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD948B6303
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 21:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pvp8jdHG/UWGJbGvH61+TCgFglQGIMninU5tKEowdE0=; b=2rcxNP1ZgAOw8wTfLDCgEEmZGq
	HEX/DALRFmEoNtr6Ef97r95ygfkYNjnqfdZsG0/kCDfU7oRQ8k5F6ZwLZHr1lGoQsxUaRPF5CBfrH
	lEQKMfJDMpO5POUJNonlUy0LzBaSDZIF7+6XCQLy/MUyNRS+1IydzSFRAws7KTHqF8nwmyTevhLjz
	HYHpy0l64QRDeFUQdA4vk4ochWviNh6pHYdbnI+Msl+ti+vN22UR1u1h+SiRlbmj7nIscdG1rKHs4
	CsqphlzsqMRxNgzvyiZaPZ/elhhYoLaUCcCQkrsLm4Roo1HNapYTf4bAm+KQZHgbiAemvWF/Q+UJB
	FuCXfBjw==;
Received: from ip6-localhost ([::1]:37772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1X9g-0061os-Px; Mon, 29 Apr 2024 19:59:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64276) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1X9c-0061ol-85
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 19:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=pvp8jdHG/UWGJbGvH61+TCgFglQGIMninU5tKEowdE0=; b=l0FB4jmbx0Yk8fR9JFav3V6zzT
 10bSxVLRGjNLNfmkYuTvOffUtXW5J8XHYu8TR2MDBfzaPAD8Q7KNd5+xSznn1eisKLzkUQGaDqLVd
 owkWUtY+NieV/AfGerp3b2qvHnG2CrPmhYwBY8XhEVpLp6SgW3P50NjdJ9XHpyx4k7GIf+QRNO2SH
 ZiyS9pLg4xb1etFxTvx1EdYYINSKQ76wX1jb6Ng1n5QHcerpVOQiTTqwmc6sGZ08XuhQVdXoYgV+6
 j6jwUj7dkpEJGx3vYnhYAlM1Zgk8a6xWAWnt2kH9jx5xSuj1Rq2rRJdulJT8IjhlBoCgmN25IR0iW
 wbk1V7pJSuy4Jlghroo6AwcWxv4GC2JgC4DwuBwyFqZxN60txU++JgQH6oRJnRfzkIDCBONSl63wb
 NaipKhmDu0kXf5XzRdfEVhlsPHHH3oE9jfrkcwFxm586qQZp5hbrKz9WYaXkYOQiuxgKocAnjXkYX
 1mvozIIGZwqp2yfcYNeYGut6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1X9b-008zKO-0T; Mon, 29 Apr 2024 19:59:11 +0000
Date: Mon, 29 Apr 2024 12:59:08 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: Samba ctime still reported incorrectly
Message-ID: <Zi/8DEo+ZiF24LLw@jeremy-HP-Z840-Workstation>
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
 <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
 <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
 <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Apr 29, 2024 at 09:27:15PM +0200, Ralph Boehme wrote:
>On 4/29/24 7:17 PM, Jeremy Allison wrote:
>>
>>If you look closely at that commit, you'll see
>>that it's actually not changing the logic that
>>previously existed :-).
>
>yeah, sure, but it was a decent refactoring so I was wondering whether 
>you'd considered the actual logic you were touching was correct. :)

That wasn't the point of the change I'd guess (although
it's from 2009, so who can remember :-).

>Hm, so what do we do? MS-FSA seems to indicate NTFS ctime has pretty 
>much the same semantics as POSIX ctime:
>
>2.1.1.3 Per File
>
>LastChangeTime: The time that identifies when the file metadata or 
>contents were last changed in the FILETIME format specified in 
>[MS-FSCC] section 2.1.1.
>
>Let's see how many tests complain:
>
><https://gitlab.com/samba-team/devel/samba/-/pipelines/1272333543>

Yep. This is the right thing to do going forward. Let's
see what breaks. Remember, 2009 was way before we had
any good time tests.


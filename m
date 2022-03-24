Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF7C4E66F2
	for <lists+samba-technical@lfdr.de>; Thu, 24 Mar 2022 17:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=aNMNUcnwYzm9aW+PHptjvgJwM15XvBX5OfJqXQsNVUI=; b=UdjF5Tu4JhBaqZi4X5JU6eR3zi
	HARwaEFmHSqNjP5RCn6YU2ejf0prpRgPOXcG60+wvZrtSmaTT8ZjQKzryKU9sVIocKpIR1k7IPyPg
	uTV717IzE0DLtTAcrRYSe9EsUXBxEvECuosNv7ItPXmA7QZD/nMYZF4M4xkru4dQgkOjPF1ko3KHD
	EuqH4pJsoA7bKQsT+Z6Jq+cGplkzNmlPGye2erXIVxbYLXanJ+eUTSDcIsOue8zDkQeNKsaYAult4
	YuXd3Z+SbOxVqs8y+LiHXUz3kAox88OjqM8ByE8VGK4Ssj9Knz5v76WW/rY4peRzBVKhLT+liHbBE
	DEbRaAsA==;
Received: from ip6-localhost ([::1]:38120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nXQFm-004sXZ-4N; Thu, 24 Mar 2022 16:24:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37844) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nXQFh-004sXQ-4M
 for samba-technical@lists.samba.org; Thu, 24 Mar 2022 16:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=aNMNUcnwYzm9aW+PHptjvgJwM15XvBX5OfJqXQsNVUI=; b=RyQ1Qc+fZ5gON/HqYKfLEZMsm3
 weucAA6NXIB6bBrgnIGpdhMOIOVgSEP28VXU7LIUhWkpjWtunE3MWHLlAMn/OipTPofSJErLrIDCS
 z4xOHSZp9mxLjBIvBJtktuoBOdEPLlDiEmcPSBx4b+ZHJcqoB6fYv413XLGb/uFIeCRC+Bc7p63pO
 RkUbKnhfsZ3ALS67nr8osJgBxA/KCILWRwlBWKrgLeTaV4i5oFQp1Qx0QLRwjNwlf2OkFGlfp76fX
 wqIRqIrQjFUy5jYk3LciWQI/7yGMW8CH0Be0+AN2k+Irb1nit91GpmbrSA1osJKv4zXiZ+onbAiC/
 v3Ts0B6viO4escniPiw+TYzYJx4ZmO85l1Vo5/ahgbdlfH17e218HFuTH1Beo0nvb/O1dMd5PYN9T
 bT9jhzHu9YeMxcVHU4qDggn+hCmjFaZecpZFt1lYWYh2UTl0V4qUCHUFMX6hECg/mm4SiQU3zAlma
 89YndcEd90okoI1bu/ovVZWH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nXQFe-003GzI-Kt; Thu, 24 Mar 2022 16:23:55 +0000
Date: Thu, 24 Mar 2022 09:23:51 -0700
To: Tom Talpey <tom@talpey.com>
Subject: Re: Signature check for LOGOFF response
Message-ID: <YjybF0CDEIkXmVov@jeremy-acer>
References: <20220319032012.46ezg2pxjlrsdlpq@cyberdelia>
 <a0972fb5-38d3-5990-7c8e-0b7dd61d1abb@talpey.com>
 <20220323172913.56cr2atzfcunv5kf@cyberdelia>
 <e23752b1-b610-98f9-c338-5faea047494c@talpey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e23752b1-b610-98f9-c338-5faea047494c@talpey.com>
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
Cc: Enzo Matsumiya <ematsumiya@suse.de>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, smfrench@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Mar 24, 2022 at 11:04:30AM -0400, Tom Talpey wrote:
>On 3/23/2022 1:29 PM, Enzo Matsumiya wrote:
>>Hi Tom,
>>
>>On 03/19, Tom Talpey wrote:
>>>What server is returning this unsigned response? Assuming it's Windows,
>>>that is either a doc bug or (arguably) a server bug, and should be
>>>reported before deciding how to address it here.
>>
>>It's a NetApp ONTAP 9.5P13. We've identified it's also setting wrong
>>signatures on READ responses with STATUS_END_OF_FILE.
>>
>>Our tests against Windows Server 2019 showed it to behave ok, so it
>>looks like something on NetApp side.
>
>In this case I don't think it is appropriate to apply the suggested
>patch. Allowing unsigned or invalidly signed responses will greatly
>reduce security. I'll be interested if NetApp provides any information.

Welcome to our world :-). Doing:

git log|grep -i NetApp|wc -l

shows 32 instances (some are commit messages with NetApp in
them two or more times so the number is probably a little
smaller than 32) of commits in Samba especially to
deal with NetApp bugs :-).

That's a lot of client bugfixes :-).


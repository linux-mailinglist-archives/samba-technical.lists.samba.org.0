Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 82777262E59
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 14:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=hvt1pGmjGL68unPEnZ9hK0EsCoSVFYNpit/E3EAMbX4=; b=nqmD7fRQSVJX3NNOBV/VY82HMQ
	8XXyvUlQIAP381m5R+DSaiN+l/anOv7+kYHOniiZRTLijDW+9+Ln7o+KxA+iM0e1d3iYNryq4Rrfy
	Zu2Sz9QSRGRxZK3vy9fLwv55J0mKzXabtJuC7QwuN5PE1dLxLZt+ouFBkP8AaiTBnTDKDddhG6ZgR
	DlV6FiMgz21y85Y875aEEhAJgfHCjnF9FE/ofgTemQ+ePCzTWXQcMcgIwZ9oieiT9XuPKpvGwKcoG
	4fi7zntVz2k9esTAm1qZY6AIxidlfIOSk1ZksCA+fqKii6TAiR/ovUJrWu3q00EziOWC/nJO5v0fO
	ya+OV1RQ==;
Received: from localhost ([::1]:27810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFywV-004lyD-Vg; Wed, 09 Sep 2020 12:11:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40290) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFywQ-004ly6-UK
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 12:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=hvt1pGmjGL68unPEnZ9hK0EsCoSVFYNpit/E3EAMbX4=; b=Gg3VmaZ/phAErSFyRVehawXHxr
 uSY+HXVLokFThyGoEp1/EahSTlz6p5zSwlak6vrveB2Xhl/jlAUF9a3Zts3zjdfVkj35HTt2X8sgC
 yZwcBmhi2GD5xlC2fj+IUXd8mQ0bYfmV+eu18y62Sqkhf1QCHkPApRUECps9OcVVuVCOwFfKdEq5X
 4V1tpwxf3MCZ+ZJbDfDHjkXoA0YW/C/H/MA1KGXbB+fmXvbVswASUq3qrkzhtDCl/6eORdhJcxfNX
 Qq8XsSAwa2Yl91tLtSAYyld9WpsYu9S4NrVO/EHjE3wLEfv+8MapdoW+U+67nUBfk/YulFWlZR9Oo
 LRQXFq6CL/Z9DzDookhD9+YKGh35GMHVsxKWZdGbsv2olfNee0n1GAi8ms351SvfW0Ml0DK8y2Lcx
 uKYkLSIXpvL7lr2dSjKBzs2p2c+YcXU4d3AihfyBrJp9S2EOzt9AiYHa+ELddXsltAyVgQWeAawMX
 KjU0nv/8s+v5e2bbkUjrZhSB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFywP-00047l-5C
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 12:11:09 +0000
Subject: Re: GSoC 2020 Samba Experience
To: samba-technical@lists.samba.org
References: <CAH72RCWUM8nqnOt=HeG1j4P-VEH4H+mF=2yo-yn3=uG6zxSx9A@mail.gmail.com>
 <877dt3w58f.fsf@suse.com>
Message-ID: <273b5aa7-02a3-67b4-a9ea-55993520b69d@samba.org>
Date: Wed, 9 Sep 2020 13:11:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <877dt3w58f.fsf@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 09/09/2020 12:37, Aurélien Aptel via samba-technical wrote:
> Hi Hezekiah,
>
> Congrats on the completion of your GSoC!
Yes, very good job :-)
>
> I agree with your comments about the doc not being straightforward for
> new users and assuming knowledge of AD and Samba code base being very
> large with no overview of what is doing what.
Problem is, the docs are written by people who know what they are doing, 
so it is hard to write it in a easily understandable way for beginners 
and when someone says something about this on the samba mailing list, 
they are very loathe to reply to 'what didn't you understand ?'
>
> I don't know if you were aware of it but Ralph made a talk this year
> trying to explain the codebase a bit. Given the time limit of the talk
> and the size of the code he had to pick an area to dig into which might
> not be what you were interested in but I think it's a step in the right
> direction.
>
> https://sambaxp.org/archive-data-samba/sxp20/sxp20-d2/sxp20-d2t1-8-boehme.mp4
>
> I also agree with the state of packaging in Linux, too many differents
> spec file conventions or competiting systems (rpm, deb, pkgbuild...) but
> as you said it's not a problem with Samba.
That has been a problem since Linux began, how about if red-hat started 
using Apt ? I didn't think that was an option :-D
>
> Good luck with your future endeavors :)
>
> Cheers,

If you put the same effort in your ongoing work placements, you will go 
far :-)

Rowland




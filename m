Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA65F2C55DE
	for <lists+samba-technical@lfdr.de>; Thu, 26 Nov 2020 14:39:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=RY1kodNEg75U4+Q2BmB3eDLFKQMRsC5n0QPGJBY6XDc=; b=Ott/77mi9qtt79SNvVJDEnkInD
	OC/9JfbnnSCYQ7vLDQqZRguwFiBwJMx00FZTmNm+4QXEXJdDgN1OzxjtOytVe7Hqt9q10rZbtTjLd
	kcaifVuiLOALQM48+0kCpTTdNqiBosWneHJRKetcifXeEe/fQbiIkK09TjZZX/nm+a0D1zIAsvt99
	ieHtDYKEwM8uvsO2CEWS+iRPR4kKBDkhhelrIIrEbsq7/wye8kZdDWeEWvU+X7wBY8mk7e194qUwq
	++VAub26Z7/ypHf2bGeXM4/6G0zIQZqxsubFhGILgTpkBvCvGCGfZWuM/e49nLzUrungZb0GusT2X
	aVunuOPg==;
Received: from ip6-localhost ([::1]:35310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kiHU6-002oXd-01; Thu, 26 Nov 2020 13:38:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47968) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kiHTw-002oXW-PE
 for samba-technical@lists.samba.org; Thu, 26 Nov 2020 13:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=RY1kodNEg75U4+Q2BmB3eDLFKQMRsC5n0QPGJBY6XDc=; b=SLQB7UZgULvhwn88U7HLr4/Irm
 fxewQXXcI445AWALCzIyS8PNS0Em6zYgZLwd8JCqvt/gefIZJvXfAiObkGHXK0DocdO1rNEenjwyR
 PKO8XWUqsshkk0iGbV8dRdJKthowDYcWNcDZWFZ6hT8aCXsKJq+SP34ge+Y+Zkl3TO+8YYvPrun5a
 r6NpFMxpwiAPg3g+EVwq2A7gncHeEaRsMv6YCmPqodpNtHtCVCtXczuFXq/9EqwXYNIPYWNrueYoF
 N7ecLTUloDVqJwjzMF1zQmyjxsjvIgt8AhG79t+/FhMmHp9472xTwa36JsNyIBoZH5s+BENIkUn1h
 Lo5d5UUiVZYeJ65GPz+IkbEJFeBbIn44UuAFrGKFwh9shAWM9BG92FyZKm8mJpM1xZ5UJVn57XjjC
 9nxliWECGMNCFFXK99eP09bH7gM6ELk1tWmH2Rb2ELO6u7Cv0W+6q1x0ozYA+hQ6oKQksfJZLhzAY
 VL56SiKtXK3gvDz3GQGqfeW1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kiHTv-0001bZ-U9
 for samba-technical@lists.samba.org; Thu, 26 Nov 2020 13:38:44 +0000
Subject: Re: about "ea support" parameter
To: samba-technical@lists.samba.org
References: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
 <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
 <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
 <1429DB9B-9F4B-421F-AC67-6DA2C4B72945@vmware.com>
Message-ID: <760bd41b-f907-6f60-2264-5b5ea9536a5f@samba.org>
Date: Thu, 26 Nov 2020 13:38:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1429DB9B-9F4B-421F-AC67-6DA2C4B72945@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/11/2020 12:31, Leo Fan via samba-technical wrote:
> Hi Ralph,
>
> Thanks for your quick response!
>
> Glad to know both Windows and MAC apps make heave use of streams but not EAs, I am more confident that we can disable EA support.
> Both Data streams and EAs are used to store extra (meta)data of files/directories.
> I am curious which kind of applications would use EA.
>
I am not confident you can disable EA support. Why do you think the 
default was set to 'yes' ? Could it have anything to do with an EA is 
where the Windows ACLs are stored by Samba ?

If you set the permissions from Windows, the ACES etc are stored in an 
EA, ergo, if you are using Windows, you really need EAs.

Rowland




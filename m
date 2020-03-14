Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E2818560F
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 18:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Jyw3g0dlej1TglwNxnq0Cu0mbTW+rKW/QYcmdhx3PGQ=; b=wNWYDGNdPjJnn0c8fQhpful2nW
	AxqGuAqcq64mjscDaMomoYA306wQE58a/uJZlTD8F55/NyoRHKmUeOx6q2ueK0I2RZaKzb8ywSf6F
	2Co4tLaT9Dl3V6cw8TwlQfm8Nqc5aU5vzjEra9939JRpiibm/D08AEujL1lFbzf9Jv5a7e9LNumHZ
	hPlZ/E1EPLRVrd8URFnfYT+bwXVxlcetmALaGPlyUIoV9UXjlD7d8aky6RUQ1wc6PmJiDzZbzuT7z
	Qn6eUqfJ+zJT4tcIPqnAHsbRqkGmX+mY7H7vWxQHNc3LE11i1MP6NPXlzod1PF2AFLiuFDaowgSvN
	FZa3HstA==;
Received: from ip6-localhost ([::1]:55044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDAEa-00G6SU-AR; Sat, 14 Mar 2020 17:06:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10152) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDAEV-00G6SN-2k
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 17:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Jyw3g0dlej1TglwNxnq0Cu0mbTW+rKW/QYcmdhx3PGQ=; b=2UQoWflJgfsp6VWeLCg+wqRw3N
 k6DG9qwMZ1pcQYminwYb7EDKU7rIJJAx64UZRK7K0Kp2ilyqLmfoLT8il5LZkMYhW6lh27w5FgMar
 lL1Ceg8aP4t/trV2kyVtYCSAYNmlhEGH3r6imX6OgOnWm7yCUyaBbA0MPR/JHFTN/bcZLpAoY4oWH
 c+/r2iN1Bt1GdW9dP1tjned8OOMfKB4TrLg6jeQiTgnb4GWbyjn/dlVVzv7WQ4SYMu7tpJs4Eg/xy
 i8VT2CUvLPhuFFawfkGC3wWKsKG4qbeqBL9mvN7tTRkWwQadzKb/JPrDO54FHIlgY5LG7+PId2Usz
 Yt7jaUCjqTSnVNUrXSiyp+hNKoxhUUxFRFk+fgJ/3QxhTj4iIK+uIcBzSKxp30FUobSYKPQVaOeLy
 /dzzMrRM0CWmRB1YoQaR2l4meocboRGafmODtfvv+vBwwsbB9G78+CCL6ER7/zAR6OBrYVzQ35O/G
 sWPu8xf6Xt5H3J0tybaSk5l3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDAET-0001Gl-IT; Sat, 14 Mar 2020 17:05:53 +0000
Date: Sat, 14 Mar 2020 10:05:49 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Fighting waf for C preprocessor output.
Message-ID: <20200314170549.GA796@jeremy-acer>
References: <20200314031555.GA16932@jeremy-acer>
 <20200314045835.GA22912@jeremy-acer>
 <91c865a391d97aacc0fcc50c50a699a8c7f7d800.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91c865a391d97aacc0fcc50c50a699a8c7f7d800.camel@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: metze@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Mar 14, 2020 at 07:48:47PM +1300, Andrew Bartlett via samba-technical wrote:
> On Fri, 2020-03-13 at 21:58 -0700, Jeremy Allison via samba-technical
> wrote:
> > On Fri, Mar 13, 2020 at 08:15:55PM -0700, Jeremy Allison via samba-technical wrote:
> > > Does anyone know how to make waf generate
> > > the actual gcc command line it uses to
> > > compile .c -> .o ?
> > > 
> > > Doing:
> > > 
> > > PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf -v build
> > > 
> > > causes it to dump out a python array, bracketed
> > > by [] characters, but I was hoping not to have
> > > to fight it any more :-).
> > 
> > Never mind, I turned it into a command line using
> > the magic of Emacs macros :-).
> 
> I wrote this script to help a while ago:
> https://wiki.samba.org/index.php/Testing_removal_of_ifdef_or_configure_checks#A_script_to_help

Oh that's really helpful Andrew, thanks a bunch !

I'll save that off in my 'useful waf tools' folder :-).


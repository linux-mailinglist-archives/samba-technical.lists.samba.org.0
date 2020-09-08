Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D93E12615F1
	for <lists+samba-technical@lfdr.de>; Tue,  8 Sep 2020 18:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=rg5b59VOtH1uUTJPvCWs7c7PqB9UO7lTwaN07ljiZnk=; b=Zmu7Cup1+Q5kktbNVmgoTbKtBh
	/3shcIU9uaJneS2aWI1vky/3AIji4Tp1FZIbxQKKmZjM3fgc9rh2AdV73p9L9M721bzdGgl8fGchr
	5U2u3+kaDz3aOq19JtdDhgrDOU/TulWJliBERxmlnTUzy4qv+MJ/rVFGmLu883wnvVz04YeiK0Us4
	Nhn4ylNc+rqFrh7qbLJwRCUOPRBCSWKTzrS9PWBqMJJvV+3EM9wgKlII70HyJX8ypz5gyM0lLdP/v
	7pXR/Dn9nQyWyNfwLu2fMjAVKbTBmiQFpDKgmdC5iC/NrVWYKPN2B5yCj5tziHGv1/Jzv5g2p6rpm
	vsfAusxQ==;
Received: from localhost ([::1]:48228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFgwu-004gaE-Tm; Tue, 08 Sep 2020 16:58:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20776) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFgwq-004ga7-Gw
 for samba-technical@lists.samba.org; Tue, 08 Sep 2020 16:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=rg5b59VOtH1uUTJPvCWs7c7PqB9UO7lTwaN07ljiZnk=; b=eAg51w8hdJ0g+mQSMcSOMnsIIx
 L6MXH+q6nlOODVshLRx5GN3z8jDx2/uyNFjPpO6hrWdA3a6koxp+2gdgbD5thaFd39yHjfN2ZgwC8
 ClumhZRW/JlH5gmmxfAYNHms4Cj7DZDjNiPJf0uc8lMGeW7j1A+TTHHFadDwhx179AKa22jWQAd94
 x4BiOwwe3nvLeObUOrWicWr2NtUetNDlVx20nmLCdMoxEYAFAxyZKYFZwaOyhKig+LKMp8lycuy2o
 sFkkbHHjs6aj6gP5n2//9oidzo/WiCxdxggG4zTOnrpGdyedMf1A/Ok5Gnv631DCaCfrtQsU5gkOj
 RlTj2Q4LnQ/UuYCIlJ1FIje4liQ/fnyrFbAjCp16+CZTFYxeDbAGXYYlLah9Ioi9dezfbi/E/miU2
 hCeGQX+UroPmVcPOmO7Ph66dHkveijeoufqAEz1kKgAV9J1JI2/yGBY/SFmZ9fEBah8CHhB1yFJHD
 GszZX4fxUQYJnWwEs/Pd2fac;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFgwo-0003Ie-UC; Tue, 08 Sep 2020 16:58:23 +0000
Date: Tue, 8 Sep 2020 19:58:20 +0300
To: Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] [WHATSNEW] Re: Drop Python2 for the build?
Message-ID: <20200908165820.GB23377@pinega.vda.li>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
 <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
 <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
 <e279b12e-0b88-3f40-3733-ea575486db28@samba.org>
 <7960be07410deb265299daf2e2af243b628f3d4d.camel@samba.org>
 <20200908161627.GB599978@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908161627.GB599978@jeremy-acer>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ti, 08 syys 2020, Jeremy Allison via samba-technical wrote:
> On Tue, Sep 08, 2020 at 10:17:54AM +1200, Andrew Bartlett via samba-technical wrote:
> > 
> > I'm sorry it was not clear, yes I mean all Python 2.x support will be
> > gone so we can focus on Python 3.6 and above.
> > 
> > Let me know if this new patch is clearer.
> 
> How about "will require Python 3.6 or later to build" ?
> 
> Don't want to mandate a specific Python3 release.

+1 from me too. ;)


-- 
/ Alexander Bokovoy


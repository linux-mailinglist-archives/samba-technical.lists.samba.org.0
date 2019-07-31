Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC287CC12
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 20:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+BIB3jADruCeeX7P35W1ZzjFDsMcfgyO9kq3GpOklsg=; b=4asb7HZIadKsChMdFm+kdU1P29
	B1P/M6tMBgsYn8tIlG8TCe/a+2ESoefJRzlT43MylbWVB5qRZFELb+IDDgtFYEc+UrrNURH1L8u9L
	8dY821Tivt4IxmzFdCBhBWCBJlapd3E9liOFhHajIKoeaN7/yvdeOytnsB2j5TEz/s66Hi4zBCMAN
	Fq21gB/oxPc7sNuat975DvCNeZm7SPDrmDyHb/PeGIN+uKmISupjh3uVegP/2Lv12NPaG/0JUYjQ+
	K/VIrjCAGWTCBJbAvuIIDyQv1hKRrgBTwL8i7i7Dzk0ueCiXfLnHwFWqJl/NMNcibDNHt1CVdyDQr
	CcaT1BlQ==;
Received: from localhost ([::1]:30838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hstT4-001aZn-8O; Wed, 31 Jul 2019 18:36:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12084) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hstSz-001aZg-Fj
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 18:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=+BIB3jADruCeeX7P35W1ZzjFDsMcfgyO9kq3GpOklsg=; b=Px2CYVAVtHYley+7bCvAuBxRxC
 +z9aYepSeEuAt5n2Uki3rKqTsaT3NPCfGiadyF73n3TWmjIK9jqWFEOnP8E+Kku+5Rotwy8ubtgQ7
 7vIQNYmiUq7bKLL8hK0I1oLmtsG9BBZWznJTmoh981GNErd91DyODYnGlE0txSD6hVA8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hstSy-0003fa-H7; Wed, 31 Jul 2019 18:36:48 +0000
Date: Wed, 31 Jul 2019 11:36:45 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: RFC --picky-developer (for developer builds)
Message-ID: <20190731183645.GE234347@jra4>
References: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
 <ab16fa62-dbef-9281-da4d-6ae2e6c9d1db@suse.com>
 <20190731155020.GA234347@jra4>
 <df405916a3b548e3e63c37467a92848015c3e4c1.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df405916a3b548e3e63c37467a92848015c3e4c1.camel@samba.org>
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
Cc: Noel Power <NoPower@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 01, 2019 at 06:36:04AM +1200, Andrew Bartlett wrote:
> On Wed, 2019-07-31 at 08:50 -0700, Jeremy Allison via samba-technical
> wrote:
> > 
> > Making autobuild work with picky developer would
> > be great ! Thanks, please push.
> 
> To be clear, autobuild already uses picky developer, this would just
> make all developer builds use it unless you opt out.
> 
> It should save fruitless CI cycles and may pick up more issues if your
> local compiler is even more strict, but doesn't affect our 'gate'.
> 
> The main impact will be on those who run a more picky (which can mean
> more OR less recent!) compilers than 'most' developers, as they may see
> their local development impacted by upstream changes by others. 

Yeah, but that already happens :-).


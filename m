Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6940569EF49
	for <lists+samba-technical@lfdr.de>; Wed, 22 Feb 2023 08:26:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=z9y0rAADbz8yJv5TBu4aaf22kiU1faLPHlbnMvisvh0=; b=hK63DcnflDr39kVqK391GDJONY
	Jn9lX8N7tyzbcUWfYVMyo4d6g3Kbq7rc2CQxmaXX767l4VvL3MNCq/GzDjIDEFqnGqRgMFBSSrK/r
	Dt+BFUzGu8Dl/A/d86DEv0Ka99/kWer6I7+fIqEKe787C3Ys1Sw0+MN/fA4As2Ai82F9pPO2Md/gC
	wkQLdmTen65LcU13nF3+DNrUKRC9672VqM7Sa9A+BT0M1l6IH2E2TVkcDhHoA/RxSzwHJy6gan1dB
	Akq3YR0HPqBAnifnnLN2pBtnIOI9bMuodyY8dfOW0qqrp7qym51o8DNKXl9ubGkWqknbGUrL4+w2v
	/1GWVpcg==;
Received: from ip6-localhost ([::1]:56894 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pUjVZ-00DO6e-5f; Wed, 22 Feb 2023 07:25:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65410) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pUjVP-00DO6R-1B
 for samba-technical@lists.samba.org; Wed, 22 Feb 2023 07:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=z9y0rAADbz8yJv5TBu4aaf22kiU1faLPHlbnMvisvh0=; b=T8VC4GMcLRwb5QC1gJCS8sgDex
 OLt6DOXLDoaPlN/Y/bp4nuoz5A30SmF9LiV3joFPvWhoGhbduQ1bUBtkciS0Cgt/OwEEo1l7xxtyr
 hJHWTATwq4KqX3j74OesMxtJrrBQt5x0zcAh9yvVmCHn756n7OA+gSs/LA5XqEiFQ7EcrPJzVV0kg
 zHqD8oYsld/ywdNKGXD7OSG7ri55rF6HwdrvMFa5L6jyjI7/xWxBbHDAPo5Pft2P2bVqI8CbJbjZS
 RRFv7rE5Q88Ym2PJ+9M2oer7/5Cpm02ao9nuFxT/6f8GB8P6M2Htx3yjro/2V30OHu2qITC9FJTt9
 SBTgTKCxIJ8+Zqjd3uDLiH0sZpZd0Ma9QI0UoGOqT0cOSro6GWou5rXtpSkytIlQv2WKxtaM4Mtu6
 1Qvk3GUiPEqOJWKbL0ADi3zd28lMokP0LPpJDS97brySM4Up9kAeQzNFNuFyv/iJmluaIjJB8t8xX
 Ij5YB7d7dHhUnbuj/LeADUzF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pUjVM-00Ff2R-Cs; Wed, 22 Feb 2023 07:25:33 +0000
To: samba-technical@lists.samba.org
Subject: Re: Failing tests on Fedora
Date: Wed, 22 Feb 2023 08:25:31 +0100
Message-ID: <12159855.O9o76ZdvQC@magrathea>
In-Reply-To: <3af805df2a359dcf695e91ced7ee0bfd9bba52a9.camel@samba.org>
References: <4782393.GXAFRqVoOG@magrathea>
 <3af805df2a359dcf695e91ced7ee0bfd9bba52a9.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 16 February 2023 09:11:41 CET Andrew Bartlett via samba-technical 
wrote:
> On Thu, 2023-02-16 at 09:04 +0100, Andreas Schneider via samba-
> 
> technical wrote:
> > Hi,
> > 
> > I'm currently trying to run 'make test' as part of the RPM build process
> > (%check). So I'm trying to get everything working, but I'm seeing strange
> > issues and I need some help to track them down.
> > 
> > We create a test user with `samba-tool user add`, which succeeds! Note
> > that
> > samba-tool directly operates on the database here!
> > 
> > Next we try to do an operation via ldap:// and if you look at the error
> > above it tells us the user we sucessfully createa a few moments agao
> > doesn't exist.
> > 
> > It looks like the samba process didn't recognize that that the database
> > was
> > modified.
> > 
> > I also see something like that with Kerberos tests, we create a user with
> > `samba-tool add user` and then the KDC can't find it in the database =>
> > same pattern.
> > 
> > I don't have deep knowledge of the AD server, so hints how to track this
> > down are much appreciated.
> 
> This is very, very strange.  Particularly if it works for a single test
> but not a suite of tests.  The KDC is just another tool reading that
> same sam.ldb, there isn't any extra cache or anything involved.

I don't find how we define which ldb uses tdb as the backend or lmdb. I would 
like to try only with tdb databases.

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




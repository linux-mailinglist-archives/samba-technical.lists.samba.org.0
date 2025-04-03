Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F16F9A799FF
	for <lists+samba-technical@lfdr.de>; Thu,  3 Apr 2025 04:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uOvwj1XRbt8WgkfBRKSAwS+uUhnvxAwgKnGjvATOiIU=; b=lRr6Qm0okMkkoB4DDHDOUvL7PE
	zN4cKaus9efRfH0jEDMHBOdhHrsiCO1rZEaONzaN945zZttj9o4hOVLZ1L5IhPyEew0BG20s3rp3c
	G3B6W/ehBV9N0zX59neVtx2FWWQzcdbiN4qxI00jh1eB8ADVLmx0nQZCCjRGdTRJAhrdAzK2Rm0Gv
	N379sBYELniM7Ph3Xwpc1nTX+yRYeP12VdXKCLh5iHI2dAHik6odhzczW191StEluqPxEjKVTXA/6
	KqOqaGfscSKXPu0lS3y5o9j0tuDGa4DnGpGudd2s0DWQVtapRjlNixD06OGPKrPzddsgMnHcoQKYP
	OFYysqIA==;
Received: from ip6-localhost ([::1]:49980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u0AR5-001cCf-11; Thu, 03 Apr 2025 02:36:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30576) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u0AR0-001cCX-1g
 for samba-technical@lists.samba.org; Thu, 03 Apr 2025 02:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=uOvwj1XRbt8WgkfBRKSAwS+uUhnvxAwgKnGjvATOiIU=; b=SY81pDkgUSArYa0jEoIKvam7m1
 li8ZRudavdNXd9hoO0YtYzT8YlfmB62+yMysEjIDw4zLuzmipyig1J52zM9yEoMAhbYR2pLKl4qvu
 1MjwUXmeO1yfGJuk/hAV7HgCdKRLk83/Uxkf7jObevp2mQsgCIpK/SVkodA5AJEDtfJ9Z5c7hztZf
 7soT8VSBlBkbCkVwLJOkk9bf+/sssgFbZ6ujbAxZBEBfhdSm9wobEeIAAfspDsnJxyDl1qE/Y1SYL
 8JlKLs684PCbXKBSqxlfy9Y5w6U6JK/QBkXenhV4rOgsCnKt2gjk1ZXVf13fHd1SMKnFx98f+9FKn
 qXyppPfroqu6DMpqc55CH0KTzLid6OX3tt88mu0l7ybZ/1orIx/DxgMH7ST867ijrxKf7O7lGHSkw
 vPqAqk00pm5Aam2N+aIm20FSHQtqYJRPINOk2ZXcZToairBXUWPPJRl0An8HC+RMPV7jGtZ78EZxs
 aWPn8Np8uP6gVain+ZksHBCi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u0AQm-007uTH-1E; Thu, 03 Apr 2025 02:35:49 +0000
Date: Thu, 3 Apr 2025 13:35:41 +1100
To: Shachar Sharon via samba-technical <samba-technical@lists.samba.org>
Subject: Re: I/O-stat module for Samba
Message-ID: <20250403133541.29ad321c.ddiss@samba.org>
In-Reply-To: <CAF8sLVVfQdp-q6U5u2iWUgR5nJ4-gGNuCDL1FAgbiztpnB0jkQ@mail.gmail.com>
References: <CAF8sLVX=j571xk8Z10WRinb=tb4OjJNgcQ+vm-eO8SR6C0XU=A@mail.gmail.com>
 <37c06470-57fa-47b4-9aa8-50f1cefa713f@samba.org>
 <CAF8sLVVfQdp-q6U5u2iWUgR5nJ4-gGNuCDL1FAgbiztpnB0jkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Shachar Sharon <ssharon@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2 Apr 2025 17:53:16 +0300, Shachar Sharon via samba-technical wrote:

> The devil is in the details ;)
> As far a I can say from reading the profile code, extending it to have
> per-share metrics is doable, but far from trivial. I will try to make
> a similar POC by extending profile infra so we can compare the two
> options.

SGI had a bunch of patches for that long ago. There should still be some
patches floating around in the archives somewhere, but all I could find
with a quick search was:
https://samba-technical.samba.narkive.com/J3LkHAoP/samba-profiling-and-pcp-pmda#post1

Cheers, David


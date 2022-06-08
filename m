Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F65438CB
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jun 2022 18:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MlRuPqvWOfuPB6i08CZ80/G0Xi5Sk5qBEa8+sNAM4Io=; b=0FRRAPpQuarC1lPINgWq519+6Z
	xl/Iv+A3rHAjaKnVlvJi8TLXrWgc5BkhMCx0qJxrxdGg6+FXUWlUS9Plb3xp92bcTxB0nqky2g3z/
	YjC1yT45rxAdGLOLITykKiVPuYzw/XvvG2DrI+CJq7P4G53FTe893RRKHUSZDJWkFRJchavGTFlCB
	L5KLmGUVlzc50803dHknQG/XQBPxKGMrr0yp4wh/CNIk3t8UpM10f0ejXFMWB0Chz722fKJpbmO9Y
	+W9VDizOjlp99W3BioYDF9thmdffZXl643XXO+fRPurjbPwxkLJxCwt+KuZrvNiZfph5P5WnYg29+
	lRb8BExw==;
Received: from ip6-localhost ([::1]:62348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nyyST-008OgP-Rl; Wed, 08 Jun 2022 16:23:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62160) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nyySO-008OgG-FW
 for samba-technical@lists.samba.org; Wed, 08 Jun 2022 16:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=MlRuPqvWOfuPB6i08CZ80/G0Xi5Sk5qBEa8+sNAM4Io=; b=esUYAdgcolfZi1JvMFzF/Uyfwm
 FYJZmjRNMukNzH0R2ztyKDjXMov8RTd134syIKTCW5UqtPD9YtlED4dbECUpVE2FF//OWeIYfMVCU
 RWnLaMYnmFE4kwH3+NmZJDuuq2+1l+qSLsZhyrj1z+jMmHfy3bwDlp4DVG/sdZAk2PienRSsSwpJy
 TTTG+ReMZtEqvPnfQZNZ/tUy1CtdQyQjOafJccsWwVTt8K92LwL+ErIijNjw0fCKTBwZFa19Y7TmA
 6chNWsrjGYkaRE0lh0borPClXp1qrMV6xw/Nld6IzjEeRzxbu67BAmeYYbX/2KubX1FC0EgWeA956
 z4cndLXNvG+mxWDML4rS6muip0Cc6lGAd+y3bxMPvBzMHC9pj7dRg7sDGL9YT2LFjFe5mZRsAcr2A
 p7LYt2p63vWFSge1nyahRbV4lrNJZFOZAsJSXTh/4Pokej8PVrZ64oQIj7aerdqI/P/JEBSsxjKsC
 9jemHglLcTFOQfjVJ7DYWOvX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nyySN-004bjs-1P; Wed, 08 Jun 2022 16:22:55 +0000
To: Andrew Bartlett <abartlet@samba.org>, Uri Simchoni <uri@samba.org>
Subject: Re: More Podman work needed
Date: Wed, 08 Jun 2022 18:22:54 +0200
Message-ID: <1924935.usQuhbGJ8B@magrathea>
In-Reply-To: <2f5a0903-d3bd-8833-6e3d-da3540124c2f@samba.org>
References: <55008d104d4efc5c286e790836e1a6d4a01ea525.camel@samba.org>
 <1737413.VLH7GnMWUR@magrathea>
 <2f5a0903-d3bd-8833-6e3d-da3540124c2f@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, June 8, 2022 4:36:53 PM CEST Uri Simchoni wrote:
> I chose the quay.io/podman/stable image because it seemed to have
> everything we need to carry out the process but come to think of it, I
> see no harm in installing packages as a preliminary step in the build
> pipeline. The extra cost of installing packages isn't significant
> considering that we rebuild images less than once per week.
> 
> So we can start with centos/centos:stream9 and install podman and
> diffutils and whatever else is needed as a first step.
> 
> One thing that did strike me as odd concerning
> quay.io/centos/centos:stream9 was that when installing packages I had to
> OK the installation of a GPG key, and I wonder why those don't come
> pre-installed on the image and how can I trust the repository if I don't
> have the keys pre-installed (or maybe I can just forget about package
> signatures, if we already trust distro repos in the image building process).
> 
> Does that seem reasonable?

Maybe the rpmkey package is missing for the repo. Which repo was it?

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




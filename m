Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 623219FF20
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2019 12:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=PvGm8ZpL+mMF0K30qFL0u+KWKMkMWQQTjzpHw97jcyg=; b=4fzSZFCnQ0vK8TRK78GrzeGYZx
	8ZH5Fl7e2rfFl+n1J9idEByuC36vCnwe68ReIsj8RP/ioJGUBb0mJ2GAVEtloYYgCgoxFrWqHGsGG
	8+PG8M1jF5tiimYE87CzwSqhnicOJX6lyz5ue1feyTJPrlWT0QZAWQ02/QSjOCmKlPralRwJsHL2o
	Cwsdb0lJav+eRokoKSVfLNWkgdD+rTxK1BsZr0HTdA6btpyq4Bjpb/AH2v16u+KSvaLUfjzAVX1yF
	IgfIlxsi7ermt2JXQCPYZQfpHtiRmy6sgEwevVVs0cVOQXdc9kFT6oawKu5f0UKtDmO35/IvC9sml
	POxwO9zg==;
Received: from localhost ([::1]:34436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2usm-008xMr-Kn; Wed, 28 Aug 2019 10:08:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40958) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2use-008xMA-A5; Wed, 28 Aug 2019 10:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=PvGm8ZpL+mMF0K30qFL0u+KWKMkMWQQTjzpHw97jcyg=; b=Ojk2wmsP9HTVtVUS0wfvyO4MQ3
 BPlsSokLv0phSX3xF3chcjZJoBT3WPwee9x4+Xcas2lu0AnMUbeQkK+nYDz1AOZBHzDRsDdgVrG01
 N7gMGpINqmCwpo0nd1eENiS/Jnd+1rlwMaQl0AxuQ6zRuRkVSZ8VT+lnxg66+ghX929k=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2usc-0004UW-Jf; Wed, 28 Aug 2019 10:08:42 +0000
To: samba-technical <samba-technical@lists.samba.org>,
 samba-announce@lists.samba.org, samba@lists.samba.org
Subject: Heads-up: Security Releases ahead!
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <de48495a-882e-3db6-91a1-3752c6421972@samba.org>
Date: Wed, 28 Aug 2019 12:08:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,



this is a heads-up that there will be Samba security updates on

Tuesday, September 3rd. Please make sure that your Samba

servers will be updated soon after the release!



Impacted components:

 - file server (in certain non-default configurations) (CVSS 8.7, High)

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de


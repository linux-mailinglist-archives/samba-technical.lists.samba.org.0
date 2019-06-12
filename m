Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421F4317F
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 23:41:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=dXV1mQy6YFRVg+BBJsmqisNQb/xEXKAFNIPte3o8t/k=; b=WVA64n/BRRO/TchDFr/0B/G7sJ
	w88CQNuBm9ZSwRMmW89i2uQ/PaKAeA/PZeJzeDH5hY8Rxk563GG4iLvXp/7/jm3aCAb4x7UfeoVad
	X26bx+bNQkJmv/Kf8l0O65JbrmlwA6/ftuSoh0ND1DAkvHRsJEK/vIlD40cmY6doVGXthOoTRkyDu
	+VZvZxaL+U9aIcRDdPeoplzPT7N2VOANf0DiJHgNqTxUlLHeTw6MW153AvoqIkQF0B2zFasPya6Cy
	FZterNWsOMhLifkcnN6Gl+l0KS0LFmq+gRqPeaPtKl7PnLt/g8a/vvheCgYlRm69UHjFF5Qe/qgnP
	HmtQRhAA==;
Received: from localhost ([::1]:18678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hbAzd-001Naq-Tm; Wed, 12 Jun 2019 21:41:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59618) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbAzY-001NaP-4z; Wed, 12 Jun 2019 21:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=dXV1mQy6YFRVg+BBJsmqisNQb/xEXKAFNIPte3o8t/k=; b=n4aP/EPuz5o8KXvC2nwY0vmDdb
 XiWXC2wnKYwT+ycAPe63A2ILEjeaUtkkwCVt9VSGKGjIZBfZaFvkSWwflS1/Y+xUe7Fo+YeTr3EcW
 9AX3Vr3elDAzJNbIPXWsDhsAzh4854zZZKFroX6tRQeBhjnZaA83Qd+K9WHGcRo6NkZ8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbAzV-000352-N4; Wed, 12 Jun 2019 21:41:11 +0000
Message-ID: <4c2c811edd4f329b66eaf72cd8f9f68fd6e5c030.camel@samba.org>
Subject: Heads-up: Security Releases ahead!
To: samba-announce@lists.samba.org
Date: Wed, 12 Jun 2019 23:40:11 +0200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba@lists.samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

This is a heads-up that there will be Samba security updates on
Wednesday, June 19 2019. Please make sure that your Samba
servers will be updated soon after the release!

Impacted components:
 - AD DC (CVSS 6.5, Medium)

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





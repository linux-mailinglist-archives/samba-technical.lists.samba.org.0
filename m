Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CFA8CDCCB
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2024 00:09:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=mKSmG4bryHB2Har1pnfRbXQ0QDC/nMHNEZCYjcbWBHM=; b=0AWkEj9qHTr6akKKbmoI4wiLXX
	qxh11MuuFMBpoH1i2Eff9x5rT9UfOujvo3/KuqA/aoiucSsrPsRNoi5Y3T7EMNCGp1hImXmu591Tc
	7rAKzFpBk3fOF8oqLpaNmqw0Wf1p8g5REFOpvGqpGG/uKtWcCXAEKze821Wy7mlIl7CUM1Etiw99+
	vHevQTTM19MjkegxP3PMz9h9y45TwCssZ7Vm9Gr8oYfXp0x34IxnKUdDZiUAFxk6WlEylfArxwbzk
	/fFlJrBW1VdD+zztany+TyeVNr9spgequheuIwjWVYgIvjd0Vr7je00V+9Du6WulWux0vEqo0t76J
	1jHIxxkQ==;
Received: from ip6-localhost ([::1]:41736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sAGcG-009nPc-S4; Thu, 23 May 2024 22:08:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39262) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sAGc9-009nPC-5I; Thu, 23 May 2024 22:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=mKSmG4bryHB2Har1pnfRbXQ0QDC/nMHNEZCYjcbWBHM=; b=PT+EJQGu1lRLEd9uiCJKd+HHbp
 thynCi85f5WnaDIy6l/5awUWAZiPY8cXZkvbXrGkIkvJclNR+wpmKywCUPgHfn1AdxFjUuxREqrbp
 slsG3rzVtrm32DMEcsQPqljSXUPtLl/aCitYsCm9PNVBzxxAHF6xqRh2i5Q+1MuTtfxjObF52tvif
 YoMN9O1lnpe2hrI7Uxu0Y47dO3jlNYEYWfqNgG+JGoZnxcBgO6PCb7kMPwDEMCYOp77lByp5RurrQ
 j8P1DLdaCyl3Fy5+XnB3VxJHLU+jUTN3A//K8nRhcaz1gONJAhOIycdfG090RDr9T8rOz4ct/+rv1
 WmRiVJJtGhw189nmbYjnNAcR0xZvmWZvkNIRMob4Bwq1YySnh1xeOMNtDqc2XplC3YLD0u5zjMp09
 h43kHDRokzcjVCpSQecDCK+rtd2hub4xEJdHIgkDVc/lFl7QXbuohf9Zbn5LETT5rk91YgCAGdRBS
 WNOo3me+qlrkwylOs4DUFrTH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sAGc6-00CsCw-19; Thu, 23 May 2024 22:08:43 +0000
Message-ID: <05990bf855c261f5d83f2c1bc15296eb3231e1ef.camel@samba.org>
Subject: Announcing a community effort to provide "LTS" for Samba 4.17:
 Samba LTS Community
To: samba@lists.samba.org, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Fri, 24 May 2024 10:08:37 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

At https://gitlab.com/samba-team/lts-community/samba some Samba
community members are collaborating to provide backports for Samba 4.17
for longer than the official Samba release cycle.

See https://wiki.samba.org/index.php/Samba_LTS_Community for our wiki
page. 

This is not an effort of the Samba Team itself, but the Samba Team is
grateful to provide a neutral host and the CI so that quality can be
maintained by the community members doing the work. 

In terms of actual engineering the project itself will stay consistent
with the Samba Team's rule of two-team members to approve each change,
and is planning to manage that via GitLab merge requests for public
patches, and the existing Bugzilla process if any work is done under
embargo.  Mailing list collaboration will be on samba-technical if
required.  

The hope that this can be a truly community collaboration for those who
need to keep older Samba versions going for a bit longer (you do not
need to be on the Samba Team to help with backports of public patches).

You may have seen announcements from one party who is funding
some engineering of this effort, and we thank them for that, without
their support this would not be able to start.  

It is hoped, and really good success here will rely on this, that
others who are using Samba 4.7 and would like it supported a bit longer
to work with us on the backport efforts. 

For end users, we know that Samba moves fast, and so we hope this
allows you to obtain from your distributor longer support for Samba
than has been possible under the main release/use/deprecation cycle so
far.

Andrew Bartlett 

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



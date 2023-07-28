Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA568766D44
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jul 2023 14:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=FuDeSclW+iu4djL4TzE7kCEqwcAxOnQuEfjxn+L0ojw=; b=SUvAeFKGZKTb8vamhn/tLhjoaE
	0qrMrgvybn+Vgg+3pok/e4b/6XhkNqf462FZKK43AEIuNiO5E97+71Jbbt1Y2jpPOPsZKiCMCEJcN
	opG8nxxoef7+SvcjbJXQfLEavWf4ysHaQwkNR0ic2XVdVzWd5Q0b5qKZMiTNtewJqBhObPI5RrcQx
	7EtBPAP7by6sfSBG77QfXOipe9yCySC2ZYJRk8629uUbu1Gc5Qp2b9cCEpYzEhI9M4idNVi44EBw8
	enYAsEYKdK4RVXsAIjgTAgYlHS0sWtDuO5cycD2O89xU8AvR3zCSH804bqnhhQTNwRZFEqagCB38V
	fLWjihlg==;
Received: from ip6-localhost ([::1]:29542 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qPMdZ-005nHA-7L; Fri, 28 Jul 2023 12:32:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qPMdT-005nH1-Vw
 for samba-technical@lists.samba.org; Fri, 28 Jul 2023 12:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=FuDeSclW+iu4djL4TzE7kCEqwcAxOnQuEfjxn+L0ojw=; b=Vrm1mczZuOlJHq17TXifhavY+s
 BdUazQiC5k4+yjXyCcLDzcWiw8x/6AiwriiZjdLKSyivQXS/ZJF1F8miCco7E0klgXwu2fCIZXHFi
 ZJSdIzGeLP7IhpO1R3CWaVml3BA5sSiUa1w+EASddUEuhmtVLHpICFbkOtRwJyI0IlwEpeiNcMbBs
 Zacnvlvs/l7a8kpeOrXJ/1r8kGfmZ82qJBvybF4DIWKtmhCvhw2byCTJ6zXVYOdlwDN8/uvDpbBg3
 jl8ZpMYtWz8js0ARmgDSebTBpi+Gji8iu5ez/n9K8o49kOZrcITt19bIEb/K9aCjQbT93UAacwA4G
 rs3LJ5UxLf0ZOJF/TkIzdIKIENjuMsqzEXXL+gFLyas4fX5MLBSf5ur7ZROL8bM+EQO50qEWin4F4
 uEYfpoPDZucFkQliwPmijoXWqBoGLxPq/l4DZBQfZn4VxH9XNa8eHc9jT6oPLSCBA98RZeGJ3Ijyp
 CTIvYblVMnUCn8vYZJe5sAas;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qPMdT-004fpW-1k for samba-technical@lists.samba.org;
 Fri, 28 Jul 2023 12:31:59 +0000
Message-ID: <8ff39fcd-6276-9d5a-ce6c-135908ea27ed@samba.org>
Date: Fri, 28 Jul 2023 14:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.19] Samba 4.19.0rc2
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.19.0rc2 is scheduled for Monday, August 7 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F684494E4A
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jan 2022 13:52:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ErRyqn6xp3bDbHPyIpeexMAgy9uKzAhSs67xUXxMa6s=; b=fIUmuWWt/17sbAZOzTW8E5TMPF
	vg5ikEa5T3HQMuAi9yqogO6gtypet0Czc34NbdFsozpX/0OLfrl9i2V1uW+GZYkmexwEmR3WNgpgM
	VEk2Yhbf+rFLoCozubBv7znEpL6VnM8IU4p09GuaAD+/Pbn4figzJBSq2tD6nPq49jSPhc9/ACwUL
	UzBqp05l2kiEIPB7vEAWG7yowdGLkz1ppvPo2SYkAQqKGvVZ78wEBrqBKDLv/w3DFIt0nPzPSOIdI
	/N3I6EyVhHIEMcC/qVZyqLM6QR273NolbW9xR2DL0Y+z877uee+GaFA3dsbprfFjj+Tyy6LzoYYW0
	KYbf9H/g==;
Received: from ip6-localhost ([::1]:26614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nAWuJ-00A4xJ-Nb; Thu, 20 Jan 2022 12:51:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55174) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nAWuB-00A4xA-Tf
 for samba-technical@lists.samba.org; Thu, 20 Jan 2022 12:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=2wmY7KsLlUNjQE6AC1wOck0HyEX5jHBN60nWyYAA4Zs=; b=fpaVo+kw2U3qTTOmqdD5kdSsqC
 NPsbxv0uTvBAVKNYPH75uA72S0F7yCRRnhqiVvMQYJn1XfGSYfuffyklSeG1+5KgR7ktRd+hVcqH4
 vTheedWs1Gth4z2XqVWO96cPYt1/NaLrifDriBkdUTntJI7lNaik9QVvK2dHT/5LfoQuzSprutDCm
 Fae0lDjfMXbKAuJmYnKC1X3i/LLv9qJMX5Jbj2H3ZX4iHuEb2dG4wpQ6occASAr7JnXuRCLYOYoVp
 D/d+xpR8cptiFPQ2lEicjJzonidqZLs4BRLwCGMK2F+mJQJKyWX26teSpk5jR0lsFgQlRHWeCJCA/
 L8uG+YGLIQWwXdR0SbCJKRsxyNA0LePPnDrE/iLZtr6X23SNgIawRbeH9+5T5wTMerEGzonK4ejfm
 zt5tdy33pzL3SF0x8ZEtB+PXiFSI40bCt01hLZqB5vFfWZEImeH8/MS/zgfRFGhTP5Ti8ovl1vMe9
 ExAmpf3xfzFfGE5vCGxscd+S;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nAWuB-008CoR-9O
 for samba-technical@lists.samba.org; Thu, 20 Jan 2022 12:51:07 +0000
Subject: [Release Planning 4.16] Samba 4.16.0rc1
To: samba-technical@lists.samba.org
Message-ID: <117d88b7-c009-438b-0722-9c0d913d6a97@samba.org>
Date: Thu, 20 Jan 2022 13:51:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

Samba 4.16.0rc1 is scheduled for Monday, January 24 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


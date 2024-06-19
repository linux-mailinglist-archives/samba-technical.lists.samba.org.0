Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB3390F0F5
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2024 16:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=axAZp+rjCZNxISGKnD0/bzWHaSDPWRvilgc/E1U6js8=; b=JGUYNXK5Piw9WupB2qasMK54Wv
	1GNPpvib+r25uxjjY8sYBIOIaOaia57Gq7JZcY98IQGSIXMixWYUXrZ8DokUmnNlDeRf2enIFdAEI
	dNASTz+Jj5iyWlwUnZqacwQeO3fLY51UEwUErkxM3MekH5FTKkRlUIBvrQj0t5UQzkMtgJFBbgtQ4
	xQvIoA/d9vDEYxpppdY2VgQJNOAtuDzBLBLM2p+MrkVORRx3zzfg0Yd2lUNQwUmy0touQiRpJ7zRH
	iYyFXFDxL4v1IJdkU7vPKClNC782JWwqEylXuNBVBX0ZJDoyO32284WzQIAEjLXaKCT8Yq/ny2AkK
	H0s49eoA==;
Received: from ip6-localhost ([::1]:29572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sJwWM-00EVj5-2z; Wed, 19 Jun 2024 14:42:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44722) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sJwWA-00EVhv-11
 for samba-technical@lists.samba.org; Wed, 19 Jun 2024 14:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=axAZp+rjCZNxISGKnD0/bzWHaSDPWRvilgc/E1U6js8=; b=ks9ZDiDOz0Qf6sJCm9Q1pUCJjV
 zWgwqPLCpVWcyeddwjBVgpGwi187gOMifBx1UM6IJk//S08eMKBIBtbkeZSmWDz2ID2IUZsWt8NZY
 M0uphsWC0/b0mHwmuurEc3a349mv4nT08nsp3ydcuXehLj7RtFCpAHtW+PvreE1JfsM1qrbJIyAN+
 bMuCk5NqFcvmGBA0kQRAWyY2kLfCWe2QB88lxDTa6tU/X+GYYzPKep+bJQaYVakf0uQ61k46fOxs/
 JYoO1CKBk2aG0gYab5TKwJ5B4OqZ9EsxAK5xWlh55gLehN8dB2DRL3vZHBEBE+GEgXV48zPJNJWFT
 e//n/4frcTO4KWl6PAbdXya3Dt7p/SpCQI3c9uAePRZw1PBWqUm0WRPPhyzyLeWv/l3WxOoE6nKeK
 xBYNATrB+1GR5vknbunj91TwFh768jsxccWwrPRT7NgSbz18pVI2rhoL86EplYKzrkR6vz9uzMOsb
 +UiehMWXTOgVR4c9B2o4kLlb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sJwW9-00Hal8-2Q for samba-technical@lists.samba.org;
 Wed, 19 Jun 2024 14:42:33 +0000
Message-ID: <57c3f408-2f31-4c79-b653-7c68abf5d4a9@samba.org>
Date: Wed, 19 Jun 2024 16:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.20] Samba 4.20.3
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

Samba 4.20.3 is scheduled for Wednesday, July 31 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



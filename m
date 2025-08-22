Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF0B31FB1
	for <lists+samba-technical@lfdr.de>; Fri, 22 Aug 2025 17:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=kmfcSfDI787mS0WEtHWJQkhkBhkx92rXkmoauN/lWK4=; b=u4Hq/jYkheAcskVse+heQ+ism+
	/gxk89JB/UBVdeP9xqyxcy+01NJMujPshCLGbdnYw7j8HyPEMPI72DQUm7duewfS4wZNreqcip1uQ
	8qntAClnZv+vAziNcSmQ+gilNzU6sjBWgfYUQS9hc1ZsiEaL4fb2hPBy5LR340gFDTA/14XkIvGaR
	yL8EIvDrnocw/PINFxOXfa0Pk3qRJI+AcATt+SNW8LUea1MsHfSbVSFFWQsceOFTMiyOU5cVN+IG6
	uoEe9rYL73M4mMPGgp/Q+LzZ/PbEq9qStq1xmXUts90mD2w7qJ5ELGhKoh9DluCcgJuTBdzdpXUih
	5hnr6Jmg==;
Received: from ip6-localhost ([::1]:58776 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1upU7A-000AAo-Eh; Fri, 22 Aug 2025 15:55:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38426) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upU6y-000A98-KZ
 for samba-technical@lists.samba.org; Fri, 22 Aug 2025 15:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=kmfcSfDI787mS0WEtHWJQkhkBhkx92rXkmoauN/lWK4=; b=IePiDr16lUspRL53+ngLwB+Qq4
 83YYUQztlh90sXU4bAGA/r9+Kvhscoi6/FdsEG+U2v7sYTjvI7toKyHcrrEFrwJk8xkqbyQq5zFV7
 m/j3xMF9eLpc+MOq/ep+2jhce+wcQyyChhGLXxBWJyPAp/23z0ZrftcTP+e+ap2mDBWoswR52GMlq
 RNimKnx5O4sWkEigWfHpscNHyDnkevoFHpYVDIsEdMHuOTSWeO2W8LCjrXNzCqx4SWZmI72+JYDlr
 WGmj5wj/OqpvC3/3I9vJvATwXGPfmwviYjwDm0zeil82ThKuh719nKUEJlOmRwofE+XQpW7SW1p6Y
 6Xkj6D3KbqPVBYLwrTqVF3A0Bhw2TmWgTzxgYF7bSsxqGcKsAf0yMNpPDK4SA8NKGxeLjbIxQxNj8
 CmONXHwUX4hPzoEC1+BVIJ6926BwZCeJI23kt0r7+T9QUS17k/Dp1ckUMm4SquIIOhnMZE7L4WaOi
 rZ3CNhSz3hah6Z9ka/58OvTn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upU6y-000I08-0I for samba-technical@lists.samba.org;
 Fri, 22 Aug 2025 15:55:28 +0000
Message-ID: <bbc4ce0b-d467-4f3f-9e83-8bff3cec297e@samba.org>
Date: Fri, 22 Aug 2025 17:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.23] Samba 4.23.0rc3
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

Samba 4.23.0rc3 is scheduled for Friday, August 29 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



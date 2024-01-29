Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FFD840C37
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jan 2024 17:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Ka+1TLZTxVcIEdQNZ/A0zc3mBHq/5kR8nFK3d/ceZWo=; b=ucdAt6zY84ceZlwmPJmopdb7kA
	09Z90WzmnpsxFcXvMQazHHlrb8fWU70kG3bhBBhQkxobR8etiXSgLf32WC7wl1Xf6R6BophsrnHrx
	F16izkkYJgyb5YJhlMQoOpYGjXAk2GMDxrQHAlBChmMZyPpKK6/KOkpn8vwnFLdmCCdMTSg348xIC
	NZZjwuwI+gNkWtehyQK0pZeV9M0kV32KALsGZAJu3fmTWfBazwGRUACuEPZPby+p86mullaZJbHgb
	hkRGPK6Juhs/F87L6FlvgDL7j1fvuxG6F4vN3B1I6FpfyF24V7GP1YnkvOacW8SpyAL10ijVMd+6M
	jq9kVv0A==;
Received: from ip6-localhost ([::1]:20576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUUp3-004wGC-7q; Mon, 29 Jan 2024 16:49:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51892) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUUoj-004wEU-NW
 for samba-technical@lists.samba.org; Mon, 29 Jan 2024 16:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Ka+1TLZTxVcIEdQNZ/A0zc3mBHq/5kR8nFK3d/ceZWo=; b=bWTAgDLMysLDich+2FrnByNKlG
 V3jkrikrTiBOsF3Ta1hUohup+sbvdIbQpyEy5T/Lu/XToJFxLVPW8kCCQb0gdNoDs1VqEyjmuPSJS
 bCMZYTcUN3BPaYZ9Z3UerdOWzZ9tpz3OMY/x8DKlR8aWv7rIm4bzvg17gUPBIW9NogMhTyB5v0c1M
 w/v2bhbnyD+7Q7eFvH2xsmxefeqQjqvYqyUAzmn/96DJrCPyLzxPYZb9+5sYxc2djDphVMmMb9/qV
 ggHhovRXlsnt0tnekaZkcmltBS6l/kMhdVAGsKz5IX+3Sbux2n0mWXg7+6rVwVu7FsyaTRbmmuI/Q
 Fgm9hn+ZAIuixtsKJu7R0WplzC9Su3QIZYhIyJKkSuY7KCrGII2KSlpazfJdslIzL6JUxmrjYYNgv
 p+9yGEROa+dEpzNKteh13VEAO7tdqrqLLCDr9gJHJSLmqpghRPo+rqy0D3misifAHegJ/gZYDykSU
 OMU6INmRWOvOWm91ltmjTQ6u;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUUoi-00AOva-2A for samba-technical@lists.samba.org;
 Mon, 29 Jan 2024 16:49:04 +0000
Message-ID: <e3e2254e-8b59-4ac1-ac0c-a8772aa900ac@samba.org>
Date: Mon, 29 Jan 2024 17:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.20] Samba 4.20.0rc2
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.20.0rc2 is scheduled for Monday, February  12 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



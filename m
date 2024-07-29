Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3A93F49B
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jul 2024 13:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=HXqegX8c6uKMz+TQW9yjA6x0yf/afQzzfOR9w2dpSjU=; b=rLEMfHM5ZQbpGPiuifKktbEkAT
	untFCvhNrCK7AADy7YYGb1fWu7sLnCtL8MmI9mm/l5I90Yj3LLkK/UqX/GBenOq0F9o6vhgLI6/N/
	KDijaqdV9dlj+yw6RmmLItNgeU0yeEE9oxQOYH3w6ES4asRmf7O0G7Mja/qIj4mEEJ8jSiHLrazBR
	wROw8KSror2J2QThk36LDW1Gp/3FYn+kYyfzaOH3obKd7MGkbVZvRa9AZVI4mbBCF2n65VmViX6gj
	LEm4aC4W1YIZP5CCNFcmvY8EoOB4FCDNuwgiuCiQtYo+RZMenCQmk/9zLKYNz/EVIBo/QIYgXn+Yq
	UpJTAyXA==;
Received: from ip6-localhost ([::1]:23966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sYOx6-001iA9-Sz; Mon, 29 Jul 2024 11:54:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54952) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sYOwm-001i8q-If
 for samba-technical@lists.samba.org; Mon, 29 Jul 2024 11:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=HXqegX8c6uKMz+TQW9yjA6x0yf/afQzzfOR9w2dpSjU=; b=w/HuJmVrLt9XtzCnE0d41BphhQ
 kGlvd6v3Ngw67pr6Nc7gwNt4SWUCjwAyWG4Q2AP8EH86Kefzr5e6FBlW8Wwl8BEaX2jBhn6B94mt/
 piwqhVzX6dIXr1EKVTgJA3gbYLMKx0CuteqQG6XKMSevvlSC9SN7Kz/eJgC/1miUtfu6Qt8auhCWs
 iTNsXg5EphuB30sbZOy/8e+A+VzFynCLefgLmx5eyXgTJq4kIq4DZexSY0cYdCB7YSzgBlbYHO8xL
 DTY5hWtiSZvmS/eA6EPYoPkB+qmz5miRsD0vMaSZyBV2vjRWuxl72Q6Xkr7U9xx2o8eeUq7uHZG83
 +S9srbDVoz5TQvs3DmpWuV0afVexAj0yDklZQI6QhMVyfJb00NWBst6TQEmW6lFWgD1bzAciGDKpk
 HMAsqiIbOOmZ7h1p4cF0nKJx9ee9bDokvWvykimO3sIYJ7W4rpG9YKmW47pey4NHhHHcolH3UL2sE
 EU4DsskeJsGnOpYgjkNHl55X;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sYOwl-003riV-2y for samba-technical@lists.samba.org;
 Mon, 29 Jul 2024 11:53:47 +0000
Message-ID: <ef43b1f5-d1e4-403b-b701-e0c0b84b2df6@samba.org>
Date: Mon, 29 Jul 2024 13:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.0rc2
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

Samba 4.21.0rc2 is scheduled for Tuesday, August 13 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



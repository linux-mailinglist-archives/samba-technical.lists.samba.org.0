Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C52D425505B
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 23:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Pf8+TA80hIOyWvRN7e9C6ZMmfE86zKQpWsbQdWjA7sA=; b=mFQTSjtx2LEiQmOqaV0fT+n5Kb
	jra5Ub2PfZjMpCMukEcyJf12IOOwYMfNoOliZMhRSvllLMX5X+PrSv6l5EKW/oig+5Ja25fI05l2y
	64lkatIi8BaJcLQxQbpUyZo0N92Bh3gHnzSkStcjXP9lhrslBmQ7eXlw+G4t8cx5obVZS7bL+s4H2
	h/mvnlFPKW/TP7q9te28JTQuOyN1NU0CcYZ050tQFHBF4mipwZSo92jffKLBhNNATf6CVdceeKD8d
	wLLjsOmh98AZ11aE++sTLZWS8wipAod3cQXKifeIltWpfHPyyHqAki6fmYb0WMbvaKuzwBJLNsbK4
	dmB8ZOmg==;
Received: from localhost ([::1]:55726 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBP9q-000zjh-1R; Thu, 27 Aug 2020 21:10:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29184) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBP9k-000zjZ-VU
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=8JFMYvdEzuozTbBrd9XxVSqD7JCGz6Hvd6LrBEVMBOw=; b=tsZhHn0pYjqc0AZAJbDcnn9hGO
 rT9QaVVBy9ZmcyN6JsnSZv/AgI2E/l+yc+buIlhqFxCSIne6VZa4OXvXllUhwu8vH/JJ9Qwvu0+Xu
 Iub+e561wU7usjWl/rWLVNLzPmBzPtUDCsjBMQfDIMNQ8BdKU39feEl3vcvuuTf5ljtn2mKtZWfml
 IMkrS1ONwnXpPy+y7hBNDH+NTFNiWPlg3Of9++3QC1XpRLKO2S8vf+gYRHCxqKqqxKF5wOCbui9Do
 6b6/rX25foyyRaVLdVtGMsMbkYhZAudUwSW5H5Ml3wEyv7bejfue5HYt6GbEUOzaBALS9U+VPoAOy
 qJEFo/Ve4ltvitmZ3hMtAKG4FY42k1Mq34sDrAmTzmXRu9XugUeIcyoOYJSFfz71PsDCWiat6lRNs
 DezszAiuNWIWhwtJwnhy5ZdiI60JhimZ30MyX7/dvPa2zEkaSIz9Exuj/XGKQWeMANNNC7hBK4yhg
 Ommj4QhaKBnKuGcsEyfyOH9S;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBP9k-0003y3-25
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:10:00 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBP9j-006hm0-Si
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:09:59 +0000
MIME-Version: 1.0
Subject: Re: waf: Prefer libsystemd to deprecated libsystemd-*
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-53@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-53@samba.org>
Date: Thu, 27 Aug 2020 21:09:59 +0000
Message-Id: <E1kBP9j-006hm0-Si@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TmV3IGNvbW1lbnQgYnkgZG91Z2xhc2JhZ25hbGwgb24gU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkK
Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvNTMjaXNzdWVjb21tZW50
LTY4MjE5MjM5OApDb21tZW50OgpBbHJlYWR5IGZpeGVkLCBhcyBwZXIgQGNyeXB0b21pbGsncyBj
b21tZW50Lgo=

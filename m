Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 477A314B3D3
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jan 2020 12:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ZGpxNsU8x7/fNZxxULfFZpau5IH3hz/dSvSTJXFySBA=; b=sjlaKNGTQkYvIOwdKu6XbD9NOY
	apSkF0P4PJVQ7NSEE6dsQplsGHaxj77d16wiyDtqcDMQLkfsE+vFkCR8f4TEaIFXuElLBUIVdKusM
	YhtroigUJJQ22hCiIhkOWUtrkZUx24BHdjgxOkjYeu1alh9Ix/zwLmeBk22MKW5opKqu6toblrvb+
	6t7yiETpBNZzzv5ptOjKMDcYVxZsuJCcSD06BpHrLxiV3kLNfDCiW3kLNl7J/KvWzBK4lPJWLCKq2
	7cQqOzzgoEZk0Fa7QvOkkO6DCfwdP7NKezdWa9oRWXtvE2NGkVVrp77Xlcyjky/Zh4gdWo6WQJXUz
	IoG9YjOQ==;
Received: from localhost ([::1]:56496 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iwPUb-0056N4-TK; Tue, 28 Jan 2020 11:57:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28848) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwPUX-0056Mx-Ut
 for samba-technical@lists.samba.org; Tue, 28 Jan 2020 11:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=ZGpxNsU8x7/fNZxxULfFZpau5IH3hz/dSvSTJXFySBA=; b=hwmclWoxwdI0TSPkG0SP3DmrDo
 xMajaXMR316WhncOxhgyeTWv33gPKLe93/7qf2qYNSfpG4EZxJmOMZTTdmzcxXP+Kt4l34ErfpUk0
 I9CqPv9NQztsU4xgR7P4fQPncUuNTTlI9zNEb6JZVMUWPxf3Tqp4SpJZ+mdnnD+6D895/+mI8LVYN
 JGSPpkYm60v6jx4iChlhSpkxQhZgsLUt21cMKdu9hukIjqQTxKUOerhWB3Xz8qQi/Pi4VJHLzZT8f
 G/pwUTA6qvU5UY12KYPOIpUtUgS7wlVPEeubxIL1nElU4rFXCWRDuUV1VwB5RzC9T1lG2D2PTmZcp
 +fHvHYUGIUXRjckjkN3m91iqX97ve5wTyNHaBSzhgwS7qcOZe5xmlF4ttiT1K7sqvLfMuoZxyT1qR
 /ir1OOXT9vc4xzEZEgX/Mc8OyPwKExne2ixQhLJDtY4Ve+rN3U5S+ROikNNztoVdtu7jRIwjKQ1Ba
 rkMsTVcsXQ4as36cu2x6/K1x;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwPUX-0003MU-Gw
 for samba-technical@lists.samba.org; Tue, 28 Jan 2020 11:57:13 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.12] Samba 4.12.0rc1
Organization: Samba Team
Message-ID: <e0031673-5e5b-cc28-b28a-f6a508ccb9af@samba.org>
Date: Tue, 28 Jan 2020 12:57:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.12.0rc2 is scheduled for Tuesday, February 4 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de


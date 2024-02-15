Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03016856DAD
	for <lists+samba-technical@lfdr.de>; Thu, 15 Feb 2024 20:27:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ttKYYqltikF6KzWicLITw18WtswdEKLvd5K7rEAGhnk=; b=wZTrPHgfObiT9+2M2QoLorMHai
	bLc8pOFzjbY56+TV8IPNdyRoQN+0wpX70pOB/JFzCdfH4LylJuNFRWrv6aqDoZEWLUhecC9pGKQxc
	0pO7xDYdWUsgr1P0gHwNYA0BcBfe7j2hsvWimW3ZRrgFNmA1jmOlq03FaGwGNWvQmjb0qcWtS8Yb6
	sSd7/9gpmrWyoUjwtwvQFLXWyKsWrlwx8DX9pkWHxG4uO4tfd3DX2stYgLxWIFWIGaY6OC9Lkrm+z
	gGUEri0Q+iknL48B84veH9zttccshPbYXTzhOZPt/1/kfcXWl1TapqIizZxSM/GrEZI0chPb3LJjI
	HJ9LXmSw==;
Received: from ip6-localhost ([::1]:39968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rahNs-008bdy-J7; Thu, 15 Feb 2024 19:27:00 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:38037) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rahNo-008bdr-2O
 for samba-technical@lists.samba.org; Thu, 15 Feb 2024 19:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ttKYYqltikF6KzWicLITw18WtswdEKLvd5K7rEAGhnk=; b=jzBntEyn0Zf7cpSOApZst7CpAx
 hBMpjPVJvG+BnmsgjYHsTLJUSLeKSdH8BUMSqZ9mAzguTB+Oy4IHe6GUkRQXGnteB+7xcrcikrxnw
 4mMauKR+BPMedYcIBJk5aLCa+IEugwXRXpk+e1847Cw+UxfUChe5vyBcFT8K3s6UPEfGbHzcoWQqk
 WCJe1a3HRhur67QOT7Mf6ZyD6pd7LhBIh7PygAlOAzOURBwWgs/1FTZAvVECRXF/MMmEwgkdMxxel
 vFLe4ltryUuz2/QcQpqJyZEQRQUtcmtZcpHfMn7Mv0yK3amaxiMb4bw5ZVvPS/U+RlGSty+DewQH5
 WaO4HXVw==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ttKYYqltikF6KzWicLITw18WtswdEKLvd5K7rEAGhnk=; b=OBe2b/nSjswqX2QxxcSbDK2SGV
 ms1ChNTEueONB3Qucvt4sFRJslN6gkvvWXRDg5X24jP9zNppcctf82Jmn0AA==;
Authentication-Results: mail.sernet.de;
 iprev=fail smtp.remote-ip=185.199.216.40
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1rahNm-003sdB-W5; Thu, 15 Feb 2024 20:26:54 +0100
Received: by intern.sernet.de
 id 1rahNm-001HhQ-C6; Thu, 15 Feb 2024 20:26:54 +0100
Message-ID: <ec8cb899-c1e7-45bd-97c9-a8d57f2c2fa9@sernet.de>
Date: Thu, 15 Feb 2024 20:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: smbd: Broken access to share
Content-Language: de-DE
To: =?UTF-8?B?0JrRg9C/0YfRg9C6INCc0LjRhdCw0LjQuyDQk9C10L7RgNCz0LjQtdCy0Lg=?=
 =?UTF-8?B?0Yc=?= <MKupchuk@inno.tech>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <c4ef9c77c4784a1898abdd266e5dccb5@inno.tech>
Organization: SerNet GmbH
In-Reply-To: <c4ef9c77c4784a1898abdd266e5dccb5@inno.tech>
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=C3=B6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Michael,

On 2/15/24 17:26, Купчук Михаил Георгиевич via samba-technical wrote:
> Found out that this patch https://gitlab.com/samba-team/samba/-/commit/0e3836e3961f2b7c39173ce1023d3c92addef630 broke access to sysvol for "Domain Admins" group members.

this patch has been reverted, already:
https://gitlab.com/samba-team/samba/-/commit/697d41420b4f4830396acfbc96bd1f1c1f0531f4

Best regards,
Björn

-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mailto:kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
AG Göttingen: HR-B 2816 - http://www.sernet.de
Datenschutz: https://www.sernet.de/datenschutz


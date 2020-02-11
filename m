Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 129C3159543
	for <lists+samba-technical@lfdr.de>; Tue, 11 Feb 2020 17:45:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=W+DVKy18RWtmcyJmdLa1RtY6UEs/LuzgT/nrZMU6EOc=; b=pTmKbm/w5W+KJAFE2F/d4tP3Yv
	zfrqsfMzfDteGqHJyTugYOMK/Gwcp4WWGLOEmWtuEtrOFowB9NhNiTTangqdS5FrniRUtKZZWBWEQ
	tfz9/+dg/GVyyOi5MhAUJB8p0g5xA2C8pHpThSvkAGB7GZFsTfcP0tKJdLkdsDl86wKF1yjsrxuoE
	6YwNAzQqxljEDFQG7Q3maYhEghbwb046QvI18lTHVIHQvvwe8pVtbDmKBsHLl2XVdoz9Q9ZtAvccN
	WPzgWlVCqfpuSbEhXjfvxH0M1dKCo+TPamVb6VP5R83/vHHmdaKNsc6yWw0UtiUXgADZe+UHDiSA5
	qGqTGMAQ==;
Received: from localhost ([::1]:23722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j1YeM-009OWi-49; Tue, 11 Feb 2020 16:44:38 +0000
Received: from air.basealt.ru ([194.107.17.39]:42470) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j1YeH-009OWb-Dl
 for samba-technical@lists.samba.org; Tue, 11 Feb 2020 16:44:35 +0000
Received: by air.basealt.ru (Postfix, from userid 490)
 id B9D7358958F; Tue, 11 Feb 2020 16:25:48 +0000 (UTC)
Received: from [10.64.128.100] (domru.bpn.su [188.235.130.108])
 by air.basealt.ru (Postfix) with ESMTPSA id 16C5458958C
 for <samba-technical@lists.samba.org>; Tue, 11 Feb 2020 16:25:47 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: XDG Desktop files with smb:// URI
Message-ID: <2c90c6d6-5c5e-76d4-8f02-0c307531ad4f@basealt.ru>
Date: Tue, 11 Feb 2020 20:25:46 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Igor Chudov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, colleagues!

Does anyone know how to create .desktop file with smb:// URI so it will 
be possible to open Samba share via file manager like Thunar or Nautilus?

I've created .desktop file like:

[Desktop Entry]
Type=Link
Version=1.0
Name=Docs
GenericName=Link to CIFS disk
Comment=Link to Samba share
URL=smb://10.x.x.x/doc/

And file managers saying "Incorrect .desktop file smb://..." despite the 
fact that copypasting link "smb://10.x.x.x/" into address field allows 
me to query the resource.

---
With best regards, Igor Chudov.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4F24FA57F
	for <lists+samba-technical@lfdr.de>; Sat,  9 Apr 2022 08:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4aQtRuyeKYeKGO8v4ItHmpgVi+OryjATbS/Yt9O6zA8=; b=IIqD1QSrYOk2zKcJh+PQyQWDfV
	ruDZeY1gQ4bGkWqZI/nEnqt4z1V/7HmHCjq9Q8Kot45jUyFGjDYmdMoIY5zBy08/K2rymfAmWcn6K
	3TVFRPFQ2qaYl+BrkI3R3OmBdwM+x5zJhJDsJ5tPnS5EC0QR99Z2qON5GM/Xd+vl4iix1BWAvVOfJ
	RTkyBrjIZBUgOTqKeRLAj4Ae88QV7ZeZAy2OBLP159Kay3i+14EQzh1XzzY2NMgaTzXBXVJaQF/kM
	j063b0UWZnCVFsxpNWBPVUM0lC3UGSFbGOtHqaOXSH8Xtzjd53iJHuwpC3Z9D+PZU/fxypkLaf+VC
	8xyGA9nQ==;
Received: from ip6-localhost ([::1]:36000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nd50Q-00BHLS-9v; Sat, 09 Apr 2022 06:55:35 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:55345) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nd504-00BHLF-P6
 for samba-technical@lists.samba.org; Sat, 09 Apr 2022 06:55:16 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id C6B8C40161
 for <samba-technical@lists.samba.org>; Sat,  9 Apr 2022 09:55:09 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7B709352
 for <samba-technical@lists.samba.org>; Sat,  9 Apr 2022 09:51:24 +0300 (MSK)
Message-ID: <7159d706-8e71-3d3e-9eca-979ebd117eb3@msgid.tls.msk.ru>
Date: Sat, 9 Apr 2022 09:55:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: waf, PYTHONHASHSEED & -I order on other architectures
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <76a4f905-6f2a-18f4-7c9d-f9846681ec01@msgid.tls.msk.ru>
In-Reply-To: <76a4f905-6f2a-18f4-7c9d-f9846681ec01@msgid.tls.msk.ru>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Just adding 3 comments to clarify (it is -ENOCOFFEE time).

1. I do set PYTHONHASHSEED=1 now everywhere, including this failing arch

2. complete build logs are available at
  https://buildd.debian.org/status/package.php?p=samba . There, the sparc64
  build failing (Click on the "Build-Attempted" link) exactly due to this
  issue.

3. the "good" version is taken from amd64 build of the same file.

Thanks,

/mjt


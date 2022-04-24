Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBC650D503
	for <lists+samba-technical@lfdr.de>; Sun, 24 Apr 2022 22:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=2izbUUjQSIJmw7wlCiSnLcSiE8kdYoOY1L73mL60BgE=; b=ly59Iw3sJoLGVGGUxG8nJXiZso
	ggG1cEsEBfeyCMkIQocimksvMzTIaeeNbH42O5eb0A2FnkPRoezXv2fByuIgv9ACUXoBJgqL8M1wM
	e8q+vi2grzNEorRcigU7nn6dnXAyJHtMwP3xq0484wQkTPzvG4krtY2fldfkdeBbavsxxbLAbzuE4
	AvG/S0KJ3aU+QHrdCrmEDVI8y+6T2wwRS1HDvG9ZsD780jFCKb7DCA21ZQI9yCogIbDPUPV9j4NhX
	m52uCXPYyRuButj8Lxbp300z0dxk8kmLBAJ8EcWDxQDTwZkOWq4BgG0duQ2laatPsxfV0mjmjuE4e
	v5sK3Hvg==;
Received: from ip6-localhost ([::1]:48822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1niiX6-001yls-KJ; Sun, 24 Apr 2022 20:08:36 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:49281) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1niiX2-001yli-2e
 for samba-technical@lists.samba.org; Sun, 24 Apr 2022 20:08:34 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E89BA40124
 for <samba-technical@lists.samba.org>; Sun, 24 Apr 2022 23:08:29 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B023335C
 for <samba-technical@lists.samba.org>; Sun, 24 Apr 2022 23:03:14 +0300 (MSK)
Message-ID: <14f83e34-b8b1-1c15-2f19-4a010ff96601@msgid.tls.msk.ru>
Date: Sun, 24 Apr 2022 23:08:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: msg.sock: is it really private dir, or a runtime/pid dir?
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

I noticed msg.sock/ subdir is created within samba private directory,
and it contains sockets for various samba processes.  This smells like
it should be done in a runtime directory (/run/samba/) instead.

In the code, in source3/lib/messages.c, this is indeed done in private dir:

       priv_path = private_path("msg.sock");

I think the sockets should not be in a private state directory to start
with.

Thanks,

/mjt


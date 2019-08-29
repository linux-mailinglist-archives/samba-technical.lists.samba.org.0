Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D2FA2772
	for <lists+samba-technical@lfdr.de>; Thu, 29 Aug 2019 21:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=65w/9OwZ3UJL3CZLPl69W7VSwtUvxudU0MJ57E64pdk=; b=S8JOO3615batccYZIf0+RS/O+F
	i462pYyk+FNx+XkaJoZ96jDf1yJm5DBeecOhEKzD7WTSZADdrMD3mP6lcY7r2QHbkFxjlbLafKqVy
	SWrtG9Dnu9MrGNpHLpQ4aV7DGhW6mWQGN1XUdj5fXFeFzBzNVlxW1+c16Xxm74v28wq6QJavLovxO
	m83JHCaNKkOffKEbjkWjDKXGtCVyVTS7/0woaF11sTBeUmZOMfq79MJ/KvQHFuH7gFD7wUukBJ1Ca
	wXB6bx3aR2CD01WTsP8zuRbrb7O4ZiXqkuoYoiHgXH/id5h94PqrvzN0xijdzUgfolpqJYraE8zuW
	rCnTToVQ==;
Received: from localhost ([::1]:25860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i3QRZ-000O1a-45; Thu, 29 Aug 2019 19:50:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40284) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i3QRV-000O0r-H3
 for samba-technical@lists.samba.org; Thu, 29 Aug 2019 19:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=65w/9OwZ3UJL3CZLPl69W7VSwtUvxudU0MJ57E64pdk=; b=GhrDZ0SUy2SmR9PIwVYDL4YRYy
 yTYThGbUDvICAzMmOQQ/HAYarFh6k1Eu4gpCiz/vH5By9duphMq41NRCOOUr7PAnMD9Fnh335U6n8
 MyDSQ1ADaqRj64FiRBHkK49BfYFNg2Ue3hjRIh5EKV2Plyu+lr37Qr/yzSkca/V46QB0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i3QRT-0006hU-1h
 for samba-technical@lists.samba.org; Thu, 29 Aug 2019 19:50:47 +0000
Date: Thu, 29 Aug 2019 12:50:43 -0700
To: samba-technical@lists.samba.org
Subject: Empty file after STATUS_DISK_FULL from CREATE
Message-ID: <20190829195042.GA13710@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

i am looking at a problem where creating a file also requested space
allocation, that failed due to insufficient quota space, the request
returned STATUS_DISK_FULL and an empty file was left behind. From
looking at the code the steps are clear: First the file is created, and
then the call to vfs_allocate_file_space() fails which  leads to
STATUS_DISK_FULL. The created file cannnot be deleted, as this would
create a race condition as it cannot be guaranteed that the same file is
deleted.

Linux provides the O_TMPFILE flag for the open() call to first create a
file without name. Then all checks could be done, including space
allocation, and only if everything succeeds the file will be linked into
a directory.  Has anybody looked whether using O_TMPFILE in Samba would
be feasible at all?

Christof


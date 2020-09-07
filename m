Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E025F900
	for <lists+samba-technical@lfdr.de>; Mon,  7 Sep 2020 13:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=RvOdqNY6yC7UeUesAntOKcDmuuAehHRoV0NsVm6Hknw=; b=5iqAqjVGGV2BVYyvTvgOmNRZca
	7MzdEunk1yP8vMzWlusy3AgfuFSkxnEKbNUq6CIjMpiOPVlKGyY5sjbcsshe0FdMCvzxXtgNoUX+q
	wUBqSUuJhemDsU/H7Yn3yO/wHktdhep6P46ifKq4CCGUZb+/NYH1e/crVBvaXp0b7tZfziSwnm79b
	qTV+rFsB0KDuZlqWT2+CWKeO3KXfI4ZJ3sy6Xku9y/kASCJD29bW9xS19SUoKocaWNX2jgi2pR4y6
	E4H9fw2csd5uuC9Ws82NB9ZUufA4SOtymuNsALE0mLGkiQXMLE6ZR5kAaQq1ISFaQchkhe9UuNZH/
	dqzzUvlA==;
Received: from localhost ([::1]:48076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFExa-004WuW-Fh; Mon, 07 Sep 2020 11:05:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38874) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFExQ-004WuP-CO
 for samba-technical@lists.samba.org; Mon, 07 Sep 2020 11:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=RvOdqNY6yC7UeUesAntOKcDmuuAehHRoV0NsVm6Hknw=; b=hHVIZA51/d+KVPtjnhdznxqCVn
 HL5YfyIey95EVY6QboI0JklYxP7r+d7K36PjhEQ/c+7DX5hKp6UvcQFQDyAyIHQOAComK7kUE1eYt
 0B0hLzL+BkCN2qmjgsGmtu0WhUfwHPe+Sksf36JycWkfdiwrVmY1oLNgdOJU1+XUiFvYKhvoD0fCK
 df7xx7xDBJ88QCcTqumPAehy705iqpBFwa9RMe7JmmRH2o4oxsOQU/3nKmWPE52oEiy1803LzOx3S
 THyn2KlalyVZgmXfOBymAkXAUN2UJLq/M10bs8tEw7yVwb8P4qB9zq1X7DwAgxumGZ2nPYM4Iwk75
 wyQFRPg3QGcfOsnduHdyXLL+A6lTyD148rXwz7h6SzZcEq53oCCd7SmfNDAn0df0e+Yh3Ieql0QWc
 Egt45f2TtZrA1vt0GlyNwRpUDFKZ2IvXwOSdHtA43bAkIVoUqImDphzU9SF5SnCAqoGULM1MYmXyE
 /SJ+NeIIVNrKqY2FDNO5mdgs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFExP-0005gT-Mz
 for samba-technical@lists.samba.org; Mon, 07 Sep 2020 11:05:07 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.13] Samba 4.13.0
Organization: Samba Team
Message-ID: <cad587a0-04ae-e979-e80f-c51d81386762@samba.org>
Date: Mon, 7 Sep 2020 13:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
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

Samba 4.13.0 is scheduled for Tuesday, September 15 2020.
If there are any objections, please let me know asap.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

Please recap if there are any release notes still missing.
Thanks!

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de


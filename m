Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 142BAE819A
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2019 07:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=2J5kvzk+ZKaEILId/JykvZULfnERxItPpBnRWylZ7pM=; b=QxO1y4WLLc+BwOcOt9IQaL4v2G
	3i6rnc5A/EcuSvV2likTcIfbnmh0t2xCS69Or3CL0VDHINbpf9oJOqVR7UUhfY5aOz5m6/s8JqATX
	/wo9M07LQoXIw/leKCB4FcITQGhYZfQ34tT+i77Wqd4gG/It19VXW61Ez7yN2H/CajyhVokTXeChL
	FEOoJdFT2wNYDJ1KkULAnBW0jDQSGSjBOnlKFeHWnOarj0u9hSahXb5KhFLtip96dGyyX4szkyovr
	9T2vAYbjjn4K7TjqjJ+PbQKjD4DK92elex8GgclrzlFpTz2c3nwSQ0mjnH6HLujG7UKIDAMXvYVbs
	yAaAK8ZQ==;
Received: from localhost ([::1]:24500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPLPx-0035Wg-Bm; Tue, 29 Oct 2019 06:55:49 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:40630) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPLPj-0035WW-2I; Tue, 29 Oct 2019 06:55:41 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id d12so5005033ybn.7;
 Mon, 28 Oct 2019 23:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rSbg15f7jZLzHvlrXyOHXvmEjfFyBmhBRQcYTxDNp00=;
 b=lA+oycjmocccmkkuByO6PAt7EDpy+NXiTc50RkhP/XttYgDbsmyG1nlezTghR1g34k
 8/Q035A6gegG5+G6lPRMhkccvSGKuw1kmaPVmMnUsbzp/rY8YBIjW03h5gglJLFj2awQ
 l8lWmpgEHp335cEs2sxNSTBZX0Z8RzLytZd6Kz2Bjr398yHrLuYSKM6w+qdMzlHlvwoG
 9TS6MXclkh/HoR7KnzqQTUu8aT764vr180wMNQxBywoKusnzr1OAoKCsWVnkWi4GRYLW
 uSF3sy+D17+f8eF5U4GCdIo3226eP7ojtGH2EE/0D8q5R8xVtPiImHO2EdYEX09ef2k2
 fQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rSbg15f7jZLzHvlrXyOHXvmEjfFyBmhBRQcYTxDNp00=;
 b=tuzfIEN4wrWuL5+IBQJE3VyzY5ipcqn0lRk6EpRjUKGryJ9rxOVjOZXzBpdT8sRPWP
 NnuCn+OKt8qKdbXNefzaGzGdaHiTmql6swhe/4h/gowl9WJQSAHgEark+b3R7WUrGGhl
 8Tfj82+HA2qUMUXuCMRarfjYcLmcmes/+0Npfse02kmbu2vzzGcw3rzlJkerlCoBX4pX
 c89tRt0wjKU9ZGXFEJ0wsZFpDImiYqz8VbMVVbssIkZq8FTgyZ3A/S5iw2fvwakx4z/k
 f1VFlR2A25vP1RG/T9q1CdKNOdQnXCiBtHDI2N3gcN2uAsuEYm158PVasR0GCPzx/yO1
 DCaQ==
X-Gm-Message-State: APjAAAWvPbD6lE4HrIakp/xoGm+5kRkThClROFWXxt3NzMoNY+GulwIm
 Tfsr71itjynTRM7ZUtM1nhEgwHnmsInKGq1XqUauUIH6
X-Google-Smtp-Source: APXvYqxih7mmDu3VCoenm5YVAevswrIY83OGzcnLmHyeR1PflAMNndS33LSo+hs0dCYNscps5zpPWqEW5x4wQ+ySPYE=
X-Received: by 2002:a25:b188:: with SMTP id h8mr16384606ybj.333.1572332131677; 
 Mon, 28 Oct 2019 23:55:31 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 29 Oct 2019 12:25:17 +0530
Message-ID: <CAG+HqKTMYkd1ynUUVZrWJy-Lu3vQwe+6kHVrghhnd9s-YAoSCg@mail.gmail.com>
Subject: After configured server signing, file transfer speed is very slow
To: samba-technical <samba-technical@lists.samba.org>,
 Samba Listing <samba@lists.samba.org>, 
 Andrew Bartlett <abartlet@samba.org>, Rowland penny <rpenny@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: VigneshDhanraj G via samba-technical <samba-technical@lists.samba.org>
Reply-To: VigneshDhanraj G <vigneshdhanraj.g@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Team,

After configured server signing as mandatory in smb.conf, file transfer
speed has slow down.
Almost 90% speed has reducing. Kindly do the needful.

Please find the below configuration:
[Global]
available= yes
restrict anonymous= 0
server string= Test
Workgroup= GNANA
netbios name= Test
realm= GNANA.COM <http://VIGNESH.COM>
password server= 192.168.1.14, *
idmap backend= tdb
idmap uid= 5000-9999999
idmap gid= 5000-9999999
idmap config GNANA : backend= rid
idmap config GNANA : range= 10000000-19999999
security= ADS
name resolve order= wins host bcast lmhosts
client use spnego= yes
dns proxy= no
winbind use default domain= no
winbind nested groups= yes
inherit acls= yes
winbind enum users= yes
winbind enum groups= yes
winbind separator= \\
winbind cache time= 300
winbind offline logon= true
template shell= /bin/sh
kerberos method= secrets and keytab
map to guest= Bad User
host msdfs= yes
strict allocate= no
encrypt passwords= yes
passdb backend= smbpasswd
printcap name= lpstat
printable= no
load printers= yes
ntlm auth= Yes
server signing= mandatory

Thanks,
Vignesh.

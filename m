Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A52366FD058
	for <lists+samba-technical@lfdr.de>; Tue,  9 May 2023 22:55:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fR9UYariANfKNbUu5CYkvB/lFJh2KDM4XjyejLUkM44=; b=ipxeb3MEtUlyU8j8YHbWYT5LQw
	mCyBXcAjhbpEmtJz/hhlzvKTIteuKi6NpUrRPsrnBRyZR7F+4ICeypJcc7uqf/ocIkRGV90xj76sU
	O8867Ar/NPU+x1ojTyXyh3k8M4FgiCFiFAW1JZsafnLaoVDSI2gsk6Bux7p1q2ya9sRX5p591yIUX
	6L+OY4zZiPrJQBOz2BzaIwJDveRIQ3xD4z8fVjQ6gzC1sZZheoJiDWk5qsePW8K9NfBd7WVkNjb2A
	HQFImqXPhjTT2DMNZglEvLbxLyHsdnktqeJ07zN5Tn9VhznHi8HxWn50IVZxJE9NOtKimOcy6O5lZ
	7uDZ+39w==;
Received: from ip6-localhost ([::1]:39308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pwUMS-009EAk-Sv; Tue, 09 May 2023 20:55:04 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:47425) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pwUMO-009EAY-MF
 for samba-technical@lists.samba.org; Tue, 09 May 2023 20:55:02 +0000
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ad1ba5dff7so42574311fa.3
 for <samba-technical@lists.samba.org>; Tue, 09 May 2023 13:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683665698; x=1686257698;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fR9UYariANfKNbUu5CYkvB/lFJh2KDM4XjyejLUkM44=;
 b=MJJGFqUVVXBGcQZWSf1KQ9ISa3lvpDx25Ekl8B6h8n4GMJI7+jCylLFacex34EbM/F
 bCSNP9PTQoKg5ZrDsRxJjSTLwJaD3I94riI8KFwbNoCftPjZbKQWkOtMPYSJ6cL8fsw0
 U+Y9cE2L8NwKSGRWYa0+0JESSEx98GNrpw3Zdnzu7UKpeSWTH+wZwzMlML9Y14Ch0fKd
 kt85zPCW9fk4G9Te0suPl+/IWa9F11AtDeL++OrmQGQEDJjbUOtIU0Sokc5nucy3ViwU
 gMStVLQ37MgsTy6lE1GT3o65kgthSAWJ35upc9ECedmxDSGfn4C3HE2jxkDueiCn8UMJ
 twYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683665698; x=1686257698;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fR9UYariANfKNbUu5CYkvB/lFJh2KDM4XjyejLUkM44=;
 b=hkNhaS4xgKnile+HyVtQdKDfvxsf7CKZBkBaNT+PK8xBR4b4l3zoUqQ7Y5R5zAUOAc
 ZIt+71nDorZSJrcvAeq2z7D/sQjX6DuBC51SWinKCYkg6bA8w7OCZF1xBAWmGfc1N7lE
 AIwzgMnr057KTHGdt0Za7v5AcqpftN3izLZOhZOv2wIvdkbG9T+xp6zcW+NZnDgsEcdJ
 6AHLO/cpX3Sp0MmgxiC06mZEH/a+UCtM1x3+G/Utg6uy2QNQ6fZyl+1REav+aT/JmCYj
 T52em0Wp9PSEgriwb30nEUI5Cq9zyGJIvSyPsrI4Yth4JLvvBJReHSdEKRn/tbEt020D
 nLgA==
X-Gm-Message-State: AC+VfDyYsBXll0/SZt8rTHzQBXWjb/3y2plo45Z9e6209zDzsY2o2LL9
 tgdYqNq3IeLwrAi6aNPHmOiJeMAvRxRJw01Zp1rhDT6wuPRGJsBz
X-Google-Smtp-Source: ACHHUZ7VVGUOPOsTKwT86ksA/6DJ9YvqHlgtol3hlgbt37vCr3s+6M0J6dNtDmX++RhgKFx0MtG4LFwIR5uJJrW4OZk=
X-Received: by 2002:a2e:7c0f:0:b0:2ac:7ae8:2c10 with SMTP id
 x15-20020a2e7c0f000000b002ac7ae82c10mr1395421ljc.33.1683665698290; Tue, 09
 May 2023 13:54:58 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 9 May 2023 15:54:47 -0500
Message-ID: <CAH2r5muZavtKBU__Qy2s+XRG11u1HXyjC3oXF2yxY5h1b2jh1g@mail.gmail.com>
Subject: Samba returning mtime for multiple time stamp fields
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed a problem with Samba when running xfstest 236.

xfstest/236 does
touch file1
stat file1
ln file1 file2
stat file2

And checks to make sure ctime is updated.  Locally I can see the ctime
is updated, but Samba reports the value of mtime in both mtime and
ctime (and doesn't show the change to ctime which causes the test to
fail)

root@smfrench-ThinkPad-P52:/mnt2# stat /test/out1
  File: /test/out1
  Size: 0          Blocks: 8          IO Block: 4096   regular empty file
Device: 10302h/66306d Inode: 552933716   Links: 2
Access: (0777/-rwxrwxrwx)  Uid: ( 1000/smfrench)   Gid: ( 1000/smfrench)
Access: 2023-05-09 15:49:37.000109800 -0500
Modify: 2023-05-09 15:49:37.000109800 -0500
Change: 2023-05-09 15:50:08.405799460 -0500
 Birth: 2023-05-09 15:49:36.980131061 -0500
root@smfrench-ThinkPad-P52:/mnt2# stat out1
  File: out1
  Size: 0          Blocks: 8          IO Block: 1048576 regular empty file
Device: 35h/53d Inode: 226         Links: 2
Access: (0777/-rwxrwxrwx)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2023-05-09 15:49:37.000109800 -0500
Modify: 2023-05-09 15:49:37.000109800 -0500
Change: 2023-05-09 15:49:37.000109800 -0500
 Birth: 2023-05-09 15:49:36.980131000 -0500

#  /usr/local/samba/sbin/smbd -V
Version 4.19.0pre1-GIT-3633027e49a


-- 
Thanks,

Steve


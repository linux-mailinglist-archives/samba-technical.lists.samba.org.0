Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A99BE17BB17
	for <lists+samba-technical@lfdr.de>; Fri,  6 Mar 2020 12:03:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=K6yQkI1GaEPfUvghlQVyWI3SS/bwgzhNsChQPcN1ICA=; b=5SF1wsk0v0nEajVDkbBeDHwNk5
	9etvzg4BlYRe0Np5G7eFOXUAMZh55WlKye/W0w1K8Q9WzoxkskPOuaM26n0gagRBKDFcl7X2hQS2e
	jnB04Q0n/x0Od9snS1wL31NkacGD5nF+ygjYFLPznGaHUoX8s9EVQSJ7otoLzPmQe1AxhwTObe8nj
	QzkhbgzWpFOp2km53Y9ER9KgxTJoqi0pHDsQqAvWS3CRw3RR6vk1C9pKOfFaHsRQvl3Wd/9njOcuY
	sW4hAsdcOs3uAP2OXGNDI3CS4nRtV1iVLXzQh7bC9RpQU6GE1SPezqCY8WbJx8owWQAF6pQ8U8Soh
	dx5G05NA==;
Received: from localhost ([::1]:20192 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jAAkr-00FHUi-4B; Fri, 06 Mar 2020 11:02:57 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:35454) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jAAkm-00FHUb-8D
 for samba-technical@lists.samba.org; Fri, 06 Mar 2020 11:02:54 +0000
Received: by mail-lj1-x22d.google.com with SMTP id a12so1772323ljj.2
 for <samba-technical@lists.samba.org>; Fri, 06 Mar 2020 03:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=K6yQkI1GaEPfUvghlQVyWI3SS/bwgzhNsChQPcN1ICA=;
 b=W1ej+FZ5LBFCbrqe8bICdYDqUuhmEZTNHFpOgRpoQMZO0HdR3rPW1i4Dcv8zLWHHGJ
 lR8DuZ6eW4i3dpzWdvAwPw2OlEEDJDhSmyHe6GNh+K86unJfd2pzR5o5yUMhpGX0hEFq
 8WeEkjBFWtajRnWsiQwK2DNXC8zLxTXeNoygwgYu8DA58AFGyiyru9CYyPwxgoU6/iAn
 JkBUJxiFlnaguUZbJh9QZFhA61rtOCJaTUZ/pix9VMqEqlQNujyb5JROZwc0/JkjP0dJ
 Cja0laVBiyI+h1xsj/K6L8CjcfH7MItgcveLjJ3OnaMl3tVFqdPQO0b8Cykf7Fz0d0O9
 Eydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=K6yQkI1GaEPfUvghlQVyWI3SS/bwgzhNsChQPcN1ICA=;
 b=TzaW4pcecgrpbaO/D26YLLaFsbjuJeocaBA0cHDAyKzHkdiOOhbhD2Y7EfS+GqnoWQ
 1WdfvV7iTD+26+Gr9Yreng+59yQ86wzbgiS7TtnNuIzdCvU9OADA/xLLPVuZMy1x0gKF
 5muz/t20+qgBL2s+l6z8mh4gfCdJPt5w7NI+DXp+QU5NGLjXyEU8n/E3BWNnowzEcvhw
 VAT1il3ph7Q4JpzDgfKLNkg6W/dYpNLrOJxu1VR30sxO2D2QT3W/N83u+fIJ9vFQ8Ggk
 JlCUhb/ZbHDJGbcWFMXv5A/Ig1L3c07Dc23KPUUsXCfa8T/ozrp2TVMrnGLh/Pb286Ux
 6FxA==
X-Gm-Message-State: ANhLgQ25j1mYcYtjiQsMNQpJV/nZZTlPyXOgmq4mK5b0PdgGOUnEzlQd
 beu7OaV4SjRJavbg7Bi+KvGZWWjZirX3MbyFHgVsq/ki
X-Google-Smtp-Source: ADFU+vvt2XogFa+desBv5uNtERN7Mt/IlYty17jopLI0RV7ZqSdW9QBUfFtgRAluEqNmnzmiIA6VIn7yuhI7OXcvSCo=
X-Received: by 2002:a2e:8197:: with SMTP id e23mr1583883ljg.250.1583492570622; 
 Fri, 06 Mar 2020 03:02:50 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 6 Mar 2020 12:02:39 +0100
Message-ID: <CAC-fF8Tc=3A=fBU5DpstKcg7YxYvi0ugFSBTAGSMz2tp6H1MFA@mail.gmail.com>
Subject: Using vfs_fruit alongside vfs_recycle
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

The manpage of vfs_fruit states that "This module is not stackable
other than described in this manpage.", is this still correct?

I'm looking into a bug report which I can reproduce on master, where
usage of vfs_fruit alongside vfs_recycle causes an error log at level
0 upon deleting a file, failing to find "._filename". So I wonder if
this configuration is unsupported or is there a logical bug here.

[2020/03/06 12:28:48.627691,  0]
../../source3/modules/vfs_recycle.c:239(recycle_get_file_size)
  recycle: stat for ./._test.txt returned No such file or directory

https://bugzilla.redhat.com/show_bug.cgi?id=1780802

Thanks!


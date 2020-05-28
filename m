Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2971E6C08
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 22:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6Vhao/JzNMrRhxDz0I8bwyuHDgqMfteBswP3vclBR2g=; b=IFFvPeAfM9F/OTGQfEQitegOMO
	JICr1P2C6J8iukYeEM3aKRWt3V5R2+Elyot0vaoeq3fWHLtNWoMelz9inkGlL/IFznirw//T0RdRH
	kpEXSib9LOFPnQFhiax0O3F7qzpRq78bUTR2ss0Zc4/gm4UD6Yoj3mFudhhHwqJpf6QrrivzVmdAA
	4YeLKibWQuAeYWyZ180ViS1NOlsxyQ8ujyh5evoVUyiN3roZyvZHBs4Sz9Fv5ZIxebsBGdYZGRaug
	4L1uxB3G5pc6aK068x2XysHLZLZoVIgUm7FBsBoQdzBvZM7VLmNcBnxNp56nh+bag8oLCkRtU7Ws1
	YfbZgbJg==;
Received: from localhost ([::1]:26420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeOme-006EVz-0J; Thu, 28 May 2020 20:05:44 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46330) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeOmU-006EVr-QQ
 for samba-technical@lists.samba.org; Thu, 28 May 2020 20:05:41 +0000
Received: by mail-ej1-x62d.google.com with SMTP id e2so1218101eje.13
 for <samba-technical@lists.samba.org>; Thu, 28 May 2020 13:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tIPG70X10VjEEroyc/k1dwmPO3SQIT/kCJaBqMjKVFY=;
 b=qbIM35jbmS2RwSOM2l+zgUamP03iqrG7tGKIOkpbobj6LwmFfQySDrR353G7e2a3dP
 rI0R/9l5MQ48H5bqgt4Y1j1lP1SwG4O1XuCle3awKxGnaITJ0Pkrivl4ckmjN1gFe1b+
 K6RP2Bedul7YuH+wsXNTRqINTpWce08l8l1Am/o0lsI3z1E0g6ZXotBQkb+2/ZfiY5bs
 6zoT5SjcB62hgiKNHNY90SE2Sp7O59T+Q+k6S7D71FQl87fp2OfD6u3kFw+nv4Ydg8xv
 Fos4DoKwRGKUgVArTQPm5MYfgOesBU9JM0W0jHdZehqVnUMlLaiHCALTbFE6f/q2+dT+
 Udug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tIPG70X10VjEEroyc/k1dwmPO3SQIT/kCJaBqMjKVFY=;
 b=i2ScHDeZsBQTHGK4lvOVHK6FbcPrpn5RU0jezzLTKhd5whkLOFwe2FcCseCgGOfwaR
 MRyY+fPVtiYtX9y9SUl5K3KU9X16gYQqFYYbSIOEuv5vAXdGPWM4VT7Pg3KYBsEWF+G1
 Qus5P1qwXrCvBm9N6GFo8DtkVexr95G5N9IeoOvAmwHMrV2d/HeXmiB5HWM384cdHkju
 Ku1uxzkijXXSclu5Gxka3R1gCZ0pvYXo1dIblKB7MYUnOcSK925oVMe3yKqryLvb+v2M
 g6to1B7UgEKbui9bJzO6VwlDq25EjpCL/DuFxwiZRGazKAcMHTfoBKI+ywUQptMfY9I6
 x+pQ==
X-Gm-Message-State: AOAM5304UZd6g5wKq5IDUIo4RGMnogpUy9g9nJF/Bss4RADLnc6cZh1S
 3uLuBgXQls3e/E2Hy/D2oR1HR9v663zw1HZhNqUg1aj0
X-Google-Smtp-Source: ABdhPJyGcPlnk22QdUCp9vvjdxvBRwUSXKg6TbBCbvG8jB8RF/sWqQwwEo/eCgJm4QfP0NSLoteK5lucHJUTZ8a3Blo=
X-Received: by 2002:a17:906:198d:: with SMTP id
 g13mr4537623ejd.281.1590696330018; 
 Thu, 28 May 2020 13:05:30 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 28 May 2020 23:00:33 +0300
Message-ID: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
Subject: Checking if Samba is running as an AD DC
To: samba-technical@lists.samba.org
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everyone,

I want to first express my gratitude to the entire Samba community.
You have been kind and very responsive whenever I ask for help or advice.
Thank you.

How else should I check that Samba is running as an AD DC apart from
looking at the smb.conf file?
Is there a process that gives me this kind of information?

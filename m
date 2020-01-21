Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5794143619
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 04:56:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=A4tDUIGRmfMPIKlyexLTrGsvOihJxfhsquzCv2ViF0c=; b=zWJ3RvVzeI9hpMOAXEktoRxCcs
	pVoY78ClqsQmfWw2oq1f00vum9GcrXXNR/Iafc48f4HQSWao8JbjsbTYiO87nNlG13AsW4T2vlYCm
	jFKpYPIxGVuHavQwjvR6m5WwEWxMGNo1tBA2Ta4amk8kORndtl275p5Pcr8kNs0t/OE34Q9of/vDM
	x/bPRsAUKQ9MvL8V1f7IVlEW8kcISp7CnMLanXVoohR4fZUtRXI7KUm9NV4rB1uJjkKKvKd6d23j1
	M2FQxbJm/UAX0OEPmpX78TtrpoCwiEFSgH6LYTBYBlgaAcivhV5PgSi2ekggGZv6tpEV9gN1KtkdQ
	2yZoeo4g==;
Received: from localhost ([::1]:41822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itkdX-003y6W-NI; Tue, 21 Jan 2020 03:55:31 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:35950) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itkdL-003y6P-LN
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 03:55:26 +0000
Received: by mail-io1-xd31.google.com with SMTP id d15so1364378iog.3
 for <samba-technical@lists.samba.org>; Mon, 20 Jan 2020 19:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=A4tDUIGRmfMPIKlyexLTrGsvOihJxfhsquzCv2ViF0c=;
 b=va2tkpi6L71ioWs27G3qEUMLYaraNLXkvXwkhtxBc/JRduz6BMOq6Loo0yRPvdoi7c
 jqzsG2PGCrYlgh7lvNCf9tq2yVP9aT37U5AaZCcXIq0nNief8Hy8QP9xeV40YyZdc8Ah
 O1WpvYwIXbYCtwCqwogr74LsvZgUqJYwluCvTgVIfFf+0MXbFZaJ+3JC+LhEzR4dWENr
 WJU+TRv/w2pRPqIiwzMqKwpkPQzXxWZ1ZTovR0dZXWycpSKoksZHTOQ3HQB6DkRN86rb
 cU35jHGRR+t28c73gKD2jxDhKrYOQDN3Y/KKhlAwH58il2cXOGjklOZyPedeM+BV9yxH
 Ly0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=A4tDUIGRmfMPIKlyexLTrGsvOihJxfhsquzCv2ViF0c=;
 b=GgFYK1VDlW4Hv1vcRbJV0FN96GRE60OxuVtJRkuOavrPJZjYKLH1ZI7if0C7ep/YqT
 O17gONHtGpDd8ZTRfrQdaRyv+AeynzVBXTuraNKp/nD06ufjnYtb05/EfyXIRDWKT6EW
 LEvRdPYd/IhXv22wLRLFkxSsed7kJVS8HcvVYN/LaLvFQZ8yHvOkEeeC79LnNjV5DtNB
 ShHlZfON6pNNVZYZIw3okJtJpw3NlpukIcBNyTV0AY7UNzrgqDWAhAHteA5TwyWxDl05
 t03/zPO62DTmfnGox0q/SNPeldLZqueLeIhyN/XgzvoS5eECGL4pt1ZFGXmWIAiHD3LU
 7AfQ==
X-Gm-Message-State: APjAAAVbSStg/Ky0z/lIY+fLLUQC41YoMCmoNTVSkH4/WF4DqoS2osEA
 kIHcOWOGDllDzqQq3CMcX92q52+n9xp9TadgMOs=
X-Google-Smtp-Source: APXvYqxcIn8DniNQJStIEFSLLJoSkZuZDAanME5mwJ0UM/0eRf98+lLJwHIXq8ODvZ36D2Yhj1f06vViWDC2c3KEn/s=
X-Received: by 2002:a02:2446:: with SMTP id q6mr1779382jae.78.1579578917548;
 Mon, 20 Jan 2020 19:55:17 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 20 Jan 2020 21:55:06 -0600
Message-ID: <CAH2r5mvUmZca8TRVsyZvrB_Loeeo4Kd8T7rHw5s6iaN=yC+O_Q@mail.gmail.com>
Subject: [LFS/MM TOPIC] Enabling file and directory change notification for
 network and cluster file systems
To: linux-fsdevel <linux-fsdevel@vger.kernel.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Currently the inotify interface in the kernel can only be used for
local file systems (unlike the previous change notify API used years
ago, and the change notify interface in Windows and other OS which is
primarily of interest for network file systems).

I wanted to discuss the VFS changes needed to allow inotify requests
to be passed into file systems so network and cluster file systems (as
an example in the SMB3 case this simply means sending a
SMB3_CHANGE_NOTIFY request to the server, whether Samba or Cloud
(Azure) or Mac or Windows or Network Appliance - all support the API
on the server side, the problem is that the network or cluster fs
client isn't told about the request to wait on the inotify event).
Although user space tools can use file system specific ioctls to wait
on events, it is obviously preferable to allow network and cluster
file systems to wait on events using the calls which current Linux
GUIs use.

This would allow gnome file manager GUI for example to be
automatically updated when a file is added to an open directory window
from another remote client.

It would also fix the embarrassing problem noted in the inotify man page:

"Inotify  reports  only events that a user-space program triggers
through the filesystem
       API.  As a result, it does not catch remote events that occur
on  network  filesystems."

but that is precisely the types of notifications that are most useful
... users often are aware of updates to local directories from the
same system, but ... automatic notifications that allow GUIs to be
updated on changes from **other** clients is of more value (and this
is exactly what the equivalent API allows on other OS).

The changes to the Linux VFS are small.


-- 
Thanks,

Steve


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1FC379A77
	for <lists+samba-technical@lfdr.de>; Tue, 11 May 2021 01:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=iYWRrcpr+cx0tsvSmF4HR7IGABDRGTF18gQhrMFWq2Y=; b=uAUfRi4GAgPReh8KpGfGH7YDCf
	Jog6AeaW55jxc+Dl0JaizYlMqFvD7efmAYKcIWsYGmDHN586UyPJRKPMAT7CIRBMZQPhxn9tB66nR
	C+j5ZM5z+hxiiaDkogUAiuGiG0WiHgm9ygNSXvyCs0ci3YnaiytozkGZGrNvptt3yv+USDRbwBipI
	sYKni3eKqiCamr2GKgNSSd4LHhYIBJhkf8tinqtEBGIeDLFSIU38/C2KVz09QetAsUs9yUlmJOqt0
	RIslDqJk+aB7wWSzUYpLSjhwRpVBm9DrUDsB6+cLIcItn5RfQXx3pYzSc5kZfG3YgSOmY4eOI1wOQ
	Vh1Yvwig==;
Received: from ip6-localhost ([::1]:38838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lgEuU-00GkKR-5V; Mon, 10 May 2021 23:01:58 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:43631) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lgEuN-00GkKI-CZ
 for samba-technical@lists.samba.org; Mon, 10 May 2021 23:01:55 +0000
Received: by mail-lj1-x233.google.com with SMTP id w15so22776341ljo.10
 for <samba-technical@lists.samba.org>; Mon, 10 May 2021 16:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=iYWRrcpr+cx0tsvSmF4HR7IGABDRGTF18gQhrMFWq2Y=;
 b=uruCfMcbDRlz4RXmVeoYO3xBZ990opIY8xC6mjkuhAhKQk6QDCxC9v2sgT16ZHrEs0
 rj7+bhSxFlfuBvKsfIJPQzD+sEhYs8s6WmgXMae35vjhAU9uWUEiZEk3eBeSQnY5RjHH
 ySX15cfjUUSAta3AJYsA4qh7lzf7w5ctj3iX/kKXMkFnKYm983LRkvUAtgSn4H9+BxAt
 YKzca1jruNIMvBRfdFx647GT2t9QnfrG0J+lz0Y0vKU1Z9uV/+HMhZdV+nM5wzBzPgGX
 /ZCJHfMed0Rr9YZ8dP+ilCe0YWR4RYZUtYmdJ7E2Eam+QwhewVGSTx3YmFm1V4PmGgYL
 upNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iYWRrcpr+cx0tsvSmF4HR7IGABDRGTF18gQhrMFWq2Y=;
 b=KNE3SFnusQSAiwLtPnpUFjAeW8x5RvmWQo1Zyae59a3HFcgnTqoA6l+QO4dkbmv4HP
 Uw5gQThREDegyMSYo4BQaa7QEvtZN3F+Iit5dIKCYLRdpYOlpPKhsnfrEvNwLa7tjCSi
 CcKaDnJRKpScTe4O/4DDq5rwYOOvBb1jEL2dFtNn8rbfjyuI+LKDWp4wTYnIVp3CRDsR
 b9T4d8HeSBRH5IK5NFr4kUgZkm2vPkNrCKaOFOIbwmRujWFS/JEKo/SVJuZjSSfCOfcF
 fMsW/2FmGlCTCfBpM3hEDPj3Y4Wn2mI+0FAxqGwUxurGLyCA1bioFnmgYtV/CtAzMOfF
 CKpw==
X-Gm-Message-State: AOAM533zxXbLlnZt9KjHhkevSHI+RkvtT0sYgqDFR5dlDIk9Kh8KWFaC
 WdhzjDEmxodPyK84q9c/4GYNGHJspEhlMkVtrc4=
X-Google-Smtp-Source: ABdhPJzfAN/sBXTxvjYsIIZwECcyr2kpfwnGqMibMXJWAB1I65VcgM4hZDicHryVG/tNBrKXfhgLf7De6b2FyaTEU5w=
X-Received: by 2002:a2e:7819:: with SMTP id t25mr800031ljc.406.1620687710044; 
 Mon, 10 May 2021 16:01:50 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 10 May 2021 18:01:39 -0500
Message-ID: <CAH2r5mviZ9SHbTZFJZDnQkJJ=XWrf88PvmYsVqoXwpBjd0xrjg@mail.gmail.com>
Subject: Add seven more xfstests to the main regression test group for the
 client
To: CIFS <linux-cifs@vger.kernel.org>, 
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>, 
 samba-technical <samba-technical@lists.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

FYI - with the features added to the client now in 5.13-rc1, I have
added 7 more xfstests to the main regression testing group (test
targets include various servers: Samba, Windows, Azure), and also to
the narrower test groups.   I do still need to check that they work to
ksmbd (the kernel server) and update that ksmbd test group later.  See

http://smb3-test-rhel-75.southcentralus.cloudapp.azure.com/#/builders/2/builds/635

-- 
Thanks,

Steve


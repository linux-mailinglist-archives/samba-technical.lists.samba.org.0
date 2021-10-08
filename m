Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6601C426F6B
	for <lists+samba-technical@lfdr.de>; Fri,  8 Oct 2021 19:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=2yL13TDt6tfy+7ma6gWgMy5j+LcQARQ38oz5PA1z3uU=; b=YrOGsMF2dQPgwV/AXuKsSlVGVE
	+U8Ynq9McilpJ4DsN3SBcho0UmBAiNVC4VgdsANubepa1lfDzjTtTW4uBrBp4s7GbkKZ36ht/WaEG
	KzZB7u4U2oj8sjPHm88XwzG/cdBDm6L3GhNxR8+8rdanxBpWdRdb/J1Z0XhLXlD3sv8gXVqp2K3nO
	hwJvgAY3oLOVE8X38p5tsWuMGJsv3C3QFNEgfq+cPgbNJLLYbBBQW+L21MKipJS+qNZ6lDIqaUgf8
	foHxUsxPIyKE/m9EHyL+j741yujcUFC7A8Av1mlWzWbfd46Ak3VIWx7RZDetW51XTbTWHLFH4UDtb
	pU8xLUEA==;
Received: from ip6-localhost ([::1]:32328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mYtUo-005WZC-LI; Fri, 08 Oct 2021 17:17:22 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:40869) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mYtUj-005WZ2-13
 for samba-technical@lists.samba.org; Fri, 08 Oct 2021 17:17:19 +0000
Received: by mail-io1-xd2f.google.com with SMTP id x1so7573859iof.7
 for <samba-technical@lists.samba.org>; Fri, 08 Oct 2021 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=fpzSqXMJhdqXGxCyjAD8yeQkbTynTrbwRr+1jyHLWXY=;
 b=ZHEedQMQBdzxKalrSUHjemIB1tOOQgYI/56mDx0tZ+JicTXUqptE58kEsT+hAaMfqc
 M/N9j9+a0pRivYZgwd9C7vYJ3w9i/p/5UZTtNcyyry8OVnOdyR51GWhYLUW6uMc7vibC
 RR8eMibn1lmMO3LU73uymIXTI9emfhBvZmRJKpI6hIaG4n/L6rzmipsQZH72xWxKx+iy
 NKIpsOUhba95V8XUxhCPscEO1ZG2HGSt0Oae7Hy2Z2DisGdY1Qn6DGCJP/RN/UOwK6NT
 4xm8e84sJn9OCRqz9bF9plxQhwKiQHrLsasbWBXOp2ih399Zgcc9PSjEM0lXrayjdESH
 S5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fpzSqXMJhdqXGxCyjAD8yeQkbTynTrbwRr+1jyHLWXY=;
 b=zXuCNMMvp5onGMnTJTFR7l7o6+Tkf2tRMO+/yb0537WbRslUCmBnlcWTaIV2lSwurj
 3VwqRZY9X4CpWVdkYPt5JZ/Tny5TvcQpwSUROREDCN3e4I6HyU+/fNabCba+WyNg/6MU
 cwnvFZsypeyG4bZ5OiggcZhZEFKiYnoce4z9BI8Sp6ru16/7HyTad0lov0RcRG69ChqR
 Za+Sze06pNmPQgUfM3GAoi3n9ti/T6O2v27Yj1KkyBBdAaITo1t9Xz5twLJ8iuSzpH4i
 8c0pW5bb5VQKw1ew1lnLu/qTXsgSpLe9a6fKctynZgChWmUYSr8IQ5Uu1lBY2cJYI1z0
 9q+Q==
X-Gm-Message-State: AOAM530xh+E/M1u8hzR0xOt573bhd8IHZ7C9lHPQi8G8u2SKwbdRfWz5
 s3HiBtR+MP21JgYpp0ERGA2OIUmtTqgg+aadJDUfDwsAKGk=
X-Google-Smtp-Source: ABdhPJxc0Vbb1Rmg9foCHEnyZJN0+oObnIGVIevmLEpXYLOmmxq85SnuQ6G4l9hfrH5JXKgOevlznZ75fFYdTyA3Nhs=
X-Received: by 2002:a6b:4e0d:: with SMTP id c13mr8447828iob.143.1633713433569; 
 Fri, 08 Oct 2021 10:17:13 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 8 Oct 2021 19:17:03 +0200
Message-ID: <CALwZj3JLO3iRDkgHeHtUpYo4j7=Ck8eo+egAu0s+LTsny4o8TA@mail.gmail.com>
Subject: Samba name mangling change?
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
From: Steffen Kern via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steffen Kern <kernsteffen1990@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I wanted to use my Ubuntu machine as a file server but I have programs that
still use 8dot3 names. I have already tested the name mangling of samba but
with hash as method I only have 5 characters of the original name and I
need at least 6 characters because many folders consist of preceeding
numbers like "2100001 test". so I would be interested if there is a way to
customize this
thanks in advance for at least looking at it

with kind regards
Kern

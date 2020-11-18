Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C222B741B
	for <lists+samba-technical@lfdr.de>; Wed, 18 Nov 2020 03:09:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=G99X2MNKzpmrAsgu0/6bNl1VWEaLLTZhIY9TY9F6UpE=; b=0dQeDzfJOa2N1INw778j65UPie
	CkDBYJ7OQCwaxVvSgDWmhOPHvUz1csMrCKLvtA08wAZ987xVZDGXGj+wI7Ox47Xlp6V6suf0Ke0+f
	t28yDNfoWFtJOxyCk0yKLBbe2y7/J1dqpcB4pSCoEZXjOckvAtv8XD0xsX7lzLX1CmcZ9DETJ5SNV
	cWEGZwZJQm/gdgArYSF1bVhWvXMfpu+sNDMkgPB5nOOO2EKeu1NzRaU2+vsANe3lKcpBzoj8mrR79
	fgl4fT230GTmHu6q1dt1r3Vp22ClJjRRVbiwRQDgoeZ89vwqhpq+M6aA4+qOmsLK/tE2Ugihu5Ccy
	sE9E7sXg==;
Received: from ip6-localhost ([::1]:61348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kfCt3-001lMp-Jr; Wed, 18 Nov 2020 02:07:57 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36999) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kfCsy-001lMi-Ms
 for samba-technical@lists.samba.org; Wed, 18 Nov 2020 02:07:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id f20so525212ejz.4
 for <samba-technical@lists.samba.org>; Tue, 17 Nov 2020 18:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=G99X2MNKzpmrAsgu0/6bNl1VWEaLLTZhIY9TY9F6UpE=;
 b=kL8EboIU0AQmhuM1u4gDf+WhFwb/GGhy7Z7+m/WdELkt7jfMJnunDlRTX8DjJfpkgd
 o+LP2lSXnpsRQgIeo3nh/q6PtXt0KkvYIYDtNsi+KTlQVPPtpCrYL+wG7Qwlir1zg7HC
 rNLpyJqLsJjpcbv/Ed/25AfQ821EUoVzFunU5PXKh0wSxXK7tPY20RT1Lto7YqhvwqUC
 0TJqt4WmPtPye6M0J1jLEAdBLD6ujrkn1hC4fTLTP5yi/9g/c8B4dK86x3yWnFLirMJk
 fYrj+8HR5pLPgVudYJgc7oF22yqLYTCIc9nX3cqWJCYuZDRY0QEtOTIi8otHWL5MXcKA
 2gbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=G99X2MNKzpmrAsgu0/6bNl1VWEaLLTZhIY9TY9F6UpE=;
 b=HqJDuKUMhp/Z+ls9sgfuxKCz9pJ0JFfxgjL21O31tInFkKovgWkhisIOb+aYcoa2Xz
 w3ZqaPvWzGIlDN5t+znXutaSrUZyQ1DxF30bsXbK6mcOgw2BIQSnago84IlpRacsb/Qu
 L5pQGEdsNdzbtpP8tDLgUI6xritbZ7KT60UIl9492S4L89HX3pL6OEFrsMnid9HUlq4/
 EiSefOxQpw6t7qu3Zk1Mv9uDJk+913jmnlpFae8qGwdAhQyJN3NfMZ01oPMQ6oyOHQM6
 5HS/2mi7doeSJ0d4WiLDAWquqG3YNi9AvyOJz2yL4aMQ66Z1QNa4njHKshutq7y0630Y
 k7Ww==
X-Gm-Message-State: AOAM533wVpCtS6zZGae9oioCNZXHl/JDgZ8+b3SAs9topv4hWeA9Xbk0
 6tfqVpjnp173sEoX908xqUk6RP6J+O98hdCYtSrIUZ8b
X-Google-Smtp-Source: ABdhPJzEMd3oLwI9ogdqD0EquRxo7prUwpoEwmiOXjGgQPmJetleo4fjYV1u2YRtQi4odULDF+uhIKDtJXAYwKymEto=
X-Received: by 2002:a17:906:824a:: with SMTP id
 f10mr22940145ejx.167.1605665267305; 
 Tue, 17 Nov 2020 18:07:47 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 17 Nov 2020 18:06:00 -0800
Message-ID: <CACyXjPyJsB7U7F5SYQVThY4ozu=JGrwVLg0GWxf4OXEnPyJJMw@mail.gmail.com>
Subject: Had a problem with CTDB recently where a winbind process held the
 lock on a domain controller
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

Are there any tools to figure out which node:process is holding a lock?

We recently saw a problem where it seemed like an instance of winbindd
was holding a lock on one of our domain controllers
(winxyz.win.ad.test) and all other instances of winbindd were
deadlocked behind that instance.

After killing lots of instances of winbindd things came good.

While the problem persisted, things like wbinfo -n
administrator@win.ad.test hung. After I killed lots of instances of
winbind, things started working.

What I would like to know is there a tool that can tell me which
node:proces has the lock on a particular node?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


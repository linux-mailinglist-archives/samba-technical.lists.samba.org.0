Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC6170418
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 17:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+zfQwVf9il0QnCDWYLbCIDKq2Cu6oGQroit8fzSLQJs=; b=xqYOVic84UA0rSa6wfkajTk/3y
	X4MDsfTg+13UpMg7r6qqtyOuQk5BK7QIAKjULjHVqm3VoPqh5uHQRScolNnhH1leVWbKbrNonEXqm
	CxnI09A/P5uCpnZY3adtoYXnSvuyZ3CRxuAkXLa3h6ivbmZO5nLgABLhua4BXpM1tteL9yB26mpI/
	Ll1T96w+ptbLn6hymHKSbtzQjIaGVM9rVnQQ2Kct2PQx18fkTC7Vp2qtbXs1/SzNRb6DbV8uMj4JQ
	cmppKv7GVKiXQrHO1pMl8bSLFOAm5BEBgLlY15mzvcRelzIPHTYUK3LcvZwK7WX92J8uRhHp7xrUu
	Z1wFNHcA==;
Received: from localhost ([::1]:19636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6zMT-00BpLR-Bf; Wed, 26 Feb 2020 16:16:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40517) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6zMO-00BpLK-PN
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 16:16:34 +0000
Received: by mail-wr1-x433.google.com with SMTP id r17so1650238wrj.7
 for <samba-technical@lists.samba.org>; Wed, 26 Feb 2020 08:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=+zfQwVf9il0QnCDWYLbCIDKq2Cu6oGQroit8fzSLQJs=;
 b=kX9SV9PEm1FZIlopXbTB6nSSQ+LlFi/0BlppGx5wGVlMUNQtkuJRpl0LSecpwzBy8J
 2J5p97wBnUx+9y78ucBg+lmFQErHg9djcCxcdwoCr6xAiXglAf8lO2uqjXkzG+5yL+U0
 xznSKh0cOwlG8hNi3bQAU/OR/cncotv6l/l/eg/rQCLcdL0NWfer/ovlut28gOiipy/2
 j6vpY3KmHABPC2KGAYEXAwQZpD5HeTkIQ1+dVIymsKQQMQfCLepqPE4CsHWXYVCcwuT+
 tEwPO9JotnHI7Qcl1eall/5fiwTQvTC6Ff8puN+droNgqsR0YdgPB/nnTpRUcNUvFVtP
 h6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=+zfQwVf9il0QnCDWYLbCIDKq2Cu6oGQroit8fzSLQJs=;
 b=nyOiHNCR8lRWD6dHjXQVO+ktRb+OdnUfN5k+cGOX7VvWC+5TlIwKwmsXanfe5PmM3y
 zx9GYXhqSzG0wpIHabrGjJoHoSWVDzAqghrfY1cNmxUt2A8FIvpsiFucIBkQ73ykMHIn
 vviNYwxTdTgA9uNi7CMnDZ+qYGQVJf9+eaWM1BqFmoM6NMwDN/9THldgGyvMJMysfQXA
 brz2IXtS+R+st3UVvYGLanVVGDg2Phe01Y4AImATroKIweB3zggDGgGDrLWYULfuAiOx
 joUKpWZmWPKOnvfhTq7KU6EuKKrCRJDsrjudCwYJyAMC9T6HoqDsZluY/lfVd3rMfoVp
 h6gA==
X-Gm-Message-State: APjAAAUaR4CYyQtr2TSuWRn7cjxIFXEuc/r23xN/DM5a/bqsmznHeQrQ
 ktiRdw4X4bBOQEuWQPmj/QQ8KvvfkOB+ypAIalHTbqV7
X-Google-Smtp-Source: APXvYqz4IPptklvVBRctTK0Tw5wAgm/DkPBwNgY7mJLcJyTFQascOlIoh7aSZFkq3ikC4/55jVg+3tNE+zOuWUusdIU=
X-Received: by 2002:adf:e80e:: with SMTP id o14mr6249763wrm.212.1582733791531; 
 Wed, 26 Feb 2020 08:16:31 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 26 Feb 2020 08:13:43 -0800
Message-ID: <CACyXjPxG-_MQst10GR61-A4LNe1bg4LE9NRCGH3myX=hSUN3iw@mail.gmail.com>
Subject: Anyone seen SMB2 signing issues with Hitachi HNAS?
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

Seeing a problem with a Hitachi HNAS (ex Bluearc) with SMB2 signing.

Tried connecting with smbclient and on the Session Setup response,
which is signed we exit with "Bad SMB2 signature for message".

I tested against a Windows 2012 DC and a capture shows that the DC is
also signing the SMB2 Session Setup response and smbclient has no
problems with it.

Is this something broken with the HNAS?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


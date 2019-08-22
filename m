Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F8399899
	for <lists+samba-technical@lfdr.de>; Thu, 22 Aug 2019 17:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=UtGLd/5h4EpertMgcsB7ozsequJ3l7wvdmhv/eWlI0s=; b=Sn41Q3Mu22xBKU0Lz/dn3wFKX6
	lFC4BKB3G7rEsg3MwgVP7UfJV/pVmtX4Jbk3tlPLJlhTMkXiuFWpWAElLq6QgSAep635GCKVzukYH
	AeY6fGQLthu/JEzU3jUAdFR87d6KuRD6bV4NJd3tN9GHnkKWsdLeK+kAtMFqzQN5GjdOpv1qMD5c7
	IH50il+sLQusqNAAphZTpvrbkIud7XySTnZNlhJ7+/Agle4UAlJP7ahWQjXW6Ql2QDFCJRCQdEWNU
	O9h/y3/XWQjtCDs/u+8g5z1EVjYTINXZM2GRDchrc2XI3gNnQZ86SSuaOq/blXRpMLZH3YqIGnVhb
	UG7quqPw==;
Received: from localhost ([::1]:49890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i0pQA-007afX-4z; Thu, 22 Aug 2019 15:54:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36606) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0pQ5-007afQ-Ub
 for samba-technical@lists.samba.org; Thu, 22 Aug 2019 15:54:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id r3so5925454wrt.3
 for <samba-technical@lists.samba.org>; Thu, 22 Aug 2019 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=UtGLd/5h4EpertMgcsB7ozsequJ3l7wvdmhv/eWlI0s=;
 b=fWcZCSE/+UcFk3xdnz0dSlu0BfDlj7f6lQvBPYqGW1nnuKesF/+JZHyge7g65Ep4nc
 ekqnz0Z5U7ME0XpKrhs3qK77ruLPEgrfztKX8z4cyLGwuiYiAKbzaSGDviwQj+Oc4A2e
 ytfNUY7Sk4IrXHiSkgZ9pIGBz2/BSVhoWQau3nPNUIWlGQKVA/p6NSw18splbBKAWqIN
 Z63qoUr6XM5sTAQmWzhnzwOi+HjYnBb90Fr8KAo19ySaQcuOUK8JA3Q4HMA8b1ILEAJ6
 zfemrt3/C3ND5TGr6ok3rmP6Xb4aGK4YCmu43xDD5mOXBOxxTKZRO4csCOu5rHqmR+k1
 285g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=UtGLd/5h4EpertMgcsB7ozsequJ3l7wvdmhv/eWlI0s=;
 b=E09OQfsBEiFGPA96iXlOIIqSmrM110M71nThrY6onZY/2sfILYsX+QixhUhiVdgCbi
 BTCfwuQ2n22dlKfA6w/zBObqqekweOuFuhH6WqbjDiK/xhnUG/SFfYf7kniBcw+zdnCw
 Ud7pfhQs62PHd9SwEQrmzrt8i78sE05C34Yik0qPTNEMtMRfUhVE7wkEwxViwPz1AYPd
 4zKfzeQrqTvaFCmTD6OJMQkDZD+wBEUERROmBNFPi9+KJkrsBOlHyZj5Kzc2EAApZJ+3
 dcwLtHC+Es2yy4NRILFthCf8iq4MHB1MS2Nqv1wWHwy9cxXr4HF+rQRITXQosFGYHDI+
 z7AQ==
X-Gm-Message-State: APjAAAWy24AQv+QijcdsAPmCxs0epbHw1cyr1VpO4izsVRtlSQdroKg3
 SFxh+b8h+DrGDs7Ti1FM24Ag11I5upZOAi257LOhFGke
X-Google-Smtp-Source: APXvYqwZo9r3pzKLc7fGq4gjoaahImgrC7qMZE4HXbjlczgVGi7hUSfAHYENET6+567m3KDN31d2HPSDy2/xK0zMJqY=
X-Received: by 2002:adf:91c2:: with SMTP id 60mr50560945wri.334.1566489276104; 
 Thu, 22 Aug 2019 08:54:36 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 22 Aug 2019 08:51:59 -0700
Message-ID: <CACyXjPxjPoewRRghAem6ZKX7VSihjno5OoO_BNV3GnOBiSJDyg@mail.gmail.com>
Subject: smbclient having problems connecting to a NetApp C-Mode system with
 kerberos
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

If I try to use Kerberos with a NetApp C-Mode system (simulator) after
doing a kinit, I get the following error:

"gse_get_client_auth_token: gss_init_sec_context failed with
[Unspecified GSS failure.  Minor code may provide more information:
Message stream modified](2529638953)"

The only thing I can find that might be related is a suggestion to
switch off AES.

Has anyone seen this problem?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


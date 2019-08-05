Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E52B681B39
	for <lists+samba-technical@lfdr.de>; Mon,  5 Aug 2019 15:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=fYe93VSzw+0mJmOgcKAW2GVqp/BBhhhsOr5/qmnp0B4=; b=A4MFxRhfFnU7yjNvBX85v29O5z
	FG8fcu3Xwv/qzTx/6G4j572ICgrFbHG5xdWGcbv/mDnmcxoROqVY10Aya1jr9RDX+KS4QGy9SetgP
	0VRex/Frq4wX5+xtDfIf8fH0ve/OOu1/77CC44bL2u5nG5ktu5J+zPzW5cDQ07TgqC/blP7jJv1an
	toVvQ/gt/njapeG0FhJESQFnuq1Gw1f90j9yUbpYgT5aUoINu0KESVkaonkUkcMo3GMuHWOVEZ6go
	LHId65naGgwKWG0/hOIXSQeX+jQfMJFuNXxNPCNWy2PQcyhnPrIEr7ABlU0rM+P/orjhm/s5fZ5y7
	W7uunsng==;
Received: from localhost ([::1]:31198 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hucn0-004F2D-I5; Mon, 05 Aug 2019 13:12:38 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:40234) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hucmw-004F26-Q1
 for samba-technical@lists.samba.org; Mon, 05 Aug 2019 13:12:36 +0000
Received: by mail-lf1-x129.google.com with SMTP id b17so57936396lff.7
 for <samba-technical@lists.samba.org>; Mon, 05 Aug 2019 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MXSB0DoRG/LPGSMlPDGX3DyP82y/qFeX/x39cQU9ZXs=;
 b=VRNhnt8/uotP65G07qmtMvBIsG2vo9muF2izbmv5iWhRlzJ+deZj2csSlvxCo87rNK
 6nUzpIzWM+oQn4F6eY+xNvmtS8IFIFkTEz7XV942iArM9iZaBInTcgxL9lRj1+l5q5VW
 t0C89cYvC/a2q0Rpkc6fh9JFnLNMfVrFoy42l2RgEAjHSQDg7LDBrdHCPrasYmpqyyQM
 sGW4vaDq9iOOZD38AuWbFZOOys5RUWAG1VqEYjgN19Ak7w89AYmCeLM2zfAfFUgkojnH
 ouV0kg4pUE2BxLAzOfnWayRHPIWHMiLm3fUYbv6OSxMsw5fdgFcuUsi9sqetu+lFXeOM
 UwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MXSB0DoRG/LPGSMlPDGX3DyP82y/qFeX/x39cQU9ZXs=;
 b=C3NkwxmVe77ahOlNciHa+1a3TPPD1YxV0J+R2tozDBrw3phon6Y/UDDA/5XDlyf69y
 f2sLtEdOM1ZdyXgQxYj7EwKLOCF2PU62iOK3C0oH6LqSkwoCnTM7WysdNAl57CTIoy1P
 D1gcMo21DuvFHoQR4DoxAXjYLW09Z1qgcG+a6qoOSSXEa2rThl+0ZI9+U4qihLfFwwPB
 gY922qFSmswqI9LXOwB6INuxrROvo9O3R5cdqInpzwBmyhmseOLAxipa7LpHbnvC4NjQ
 uNpEoICfmBdnAiM/A65LrczAM88CUtbHvuCdXn52xKB6X1hNdPMx1SoF+X4y/tcAyrB7
 bTkg==
X-Gm-Message-State: APjAAAWPbmYECdhtbYq997YTM9K5JpL+GkkUprjGezG5/DEhsk8qFHuP
 iXq2yWi39C70J/shj7S2JZkGBd4+mj2Qn7+7RjKdpb2z8dc=
X-Google-Smtp-Source: APXvYqyk2m3JP3aM2r+USYA3Ft9ky9o2H8JVNGBY1clfiasq0snsS0EK1G4xPJ28y9UmZi+K9d5/F6rdseJJjCCc/V4=
X-Received: by 2002:a19:a419:: with SMTP id q25mr5863865lfc.136.1565010752529; 
 Mon, 05 Aug 2019 06:12:32 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 5 Aug 2019 14:12:21 +0100
Message-ID: <CAELK94dnHMQrgttELeaNJn1jBYDf+m-e11MMnSfGFn9zvfGtPw@mail.gmail.com>
Subject: GSOC 2019 : Improve smbcmp - week 8
To: P Mairo via samba-technical <samba-technical@lists.samba.org>
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, here is a summary of my activities for this week:
- Merge previous work with main repository
- Set up development environment with wxpython (install, import
documentation in zeal, ...)
- Quickstart with wxpython

-- 
https://github.com/RMPR/smbcmp-gui <https://github.com/RMPR>

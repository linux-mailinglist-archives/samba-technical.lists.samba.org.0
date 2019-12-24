Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D1912A43C
	for <lists+samba-technical@lfdr.de>; Tue, 24 Dec 2019 22:56:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=CobKxrXrCDfFVNX7LHcevWEXogurSA+xi/U5Tsf7eLk=; b=1p/yi/F0+HYB2sgRQbLA1PCwAF
	NEaHoaPGw4RCc4i7YQKbhAuefnabFyBC5E1/fa8PdNReQnPPLBjfM/B54CwjTSI6r1YF7I/a8VoT5
	w+vTYR2P30ExRWQGC4EiXLn+hryKLDttJDkVUTkyCisc8kd1hWxasa3/9e2BQMtduKEgsEEdMqchc
	YZu0PAS5i8U6JYWmqTToja/SMmeqxth/LQHbg13EJj1NQHHPPNKAmh/aC38F2fUj7wD1ZdVvl57He
	ARgG45/brynkuVCpBWiCEO+KmWsh8fiFVIud+l33sN22yp5pw60vU2AQ4K7H7cHG45hO5gGdRvRmN
	Yhc66gQg==;
Received: from localhost ([::1]:44652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ijs90-0004tT-JR; Tue, 24 Dec 2019 21:55:10 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:41138) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ijs8w-0004tI-Cl
 for samba-technical@lists.samba.org; Tue, 24 Dec 2019 21:55:08 +0000
Received: by mail-il1-x132.google.com with SMTP id f10so17321028ils.8
 for <samba-technical@lists.samba.org>; Tue, 24 Dec 2019 13:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CobKxrXrCDfFVNX7LHcevWEXogurSA+xi/U5Tsf7eLk=;
 b=QQN5Ee3VhfrzJTEa7Pdw8z8ay1LOX6ElhDb4KcRVC+038LpNv8Th8uaECBspCC90eq
 NRJS1Z2vTMEGe736H2TYegqG5krGQLhK/LSEs4nvYUcBdoSp6IhHcDEujcD27ximMYhb
 3BLrc8g+KPO0jqzTKyol3InqZzGM24oxtr7JCNaG0MMCYuuHgT16XZShvj0ZKQZAMFBE
 dDGm+uE9iNt8nf7556JEYo7kadBloZC1+mQhwGgO1WLET2SQCHFO7ef3E1Xcx2UNMeuf
 Nuy2q5+1zylSUkCVzljFOml/JeiPmz/zdAZtjmmtcPaTGVs83xHelOlDAkxOYu4ybBKP
 R/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CobKxrXrCDfFVNX7LHcevWEXogurSA+xi/U5Tsf7eLk=;
 b=sN4VXUGhIJJLCTsa8I0TgR7spyPmnHecYG25X3/SUfdF90ZEjoJQo7L5nzRsyjTaxW
 W1mQtSwdWUv/HeE6+fjoP0S9glp+DxMvPVUxoduvetyNR+UeB9waCoWOnYb+GdcQUZoX
 Vlm/fYVh45O8rxPJDfDq9oc4lRb7pAQK7ex0iLDoVn0TWHw4GF/xPxbGoubBYf65jfJY
 oupizr8idJc2kVxhMeH92mdlcQ0UszQ0tnqUof8esbwaD+52hip3lucGvAo6ZN8CuqLC
 Nx/yqeMg1HaSWWi5VKkgF2wPR5xKEJcr5p6/86gT5qfQIGdsfw3DJiD5xZWD0CEOux6s
 DDRw==
X-Gm-Message-State: APjAAAWUqnIOB4CiS7nrOLlpKnqY2IHjQGfQPDeAZiVMknDAkytyg4Rx
 5+LjF34khA5yAAAum60mAHSi1bpoq8ysBh7EDN9mFQ==
X-Google-Smtp-Source: APXvYqy7eb0eKyCq79wY+hZWz6eMOult5eBxSYpVM030nVdEuFFgZS6+3ZBaM1jMsHGuqG7/D6t9l4bJMU5ddsk6aug=
X-Received: by 2002:a92:17cb:: with SMTP id 72mr32203960ilx.173.1577224494448; 
 Tue, 24 Dec 2019 13:54:54 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 24 Dec 2019 15:54:43 -0600
Message-ID: <CAH2r5mthJ6t+jNUPNTepRSRVxdE3RXt3qcOxR_qRzJSnHn8n=Q@mail.gmail.com>
Subject: Samba doesn't allow setting ACLs for special SIDs
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed that Samba server doesn't allow setting ACLs for special
SIDs (like the 'NFS' or POSIX mode bits etc.).    Looking at
vfs_acl_xattr it automatically resets the value of

force unknown acl user to true (which prevents setting special SIDs
that don't map to users that Samba doesn't know about).

Is there a way to configure Samba allow setting special SIDs?
Presumably if acl_xattr is not set then the ACL can't be saved and if
acl_xattr is used then unknown SIDs are remapped so are useless.

Ideas?

-- 
Thanks,

Steve


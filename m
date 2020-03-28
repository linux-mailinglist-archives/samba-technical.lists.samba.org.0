Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AFB1964CF
	for <lists+samba-technical@lfdr.de>; Sat, 28 Mar 2020 10:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=cN5BPmO5UEfLLFQp8eKqUlSY8Bv3kUDba7nIV09xF38=; b=hvDS8bc6FSHdALpchZPYMYaoZQ
	ODN3kBNZnS+fdLMP7KizrXjByL1k+z2K7c8B5xc8T4xyOUF6/uEKGbdvpnoDJhYrRs/degPso1fKG
	srT0+M+xvm5PneIJf9Ay8bJzrk9YgT5EiRdX3ktrSFwCBGX6rUlq3c+Ioo1MLw6MT1XqHykZci3yL
	aFOgGnssBFoW21CdudfRWSXqw0DfFH80axKA2Ybj0ZCsUiW+N6Yfb3fbJ1MuTgrS7jOWpIjcj1v2d
	3nYcXJmZPDGTPnURaOuuw/bdwQ2RDz2wwRW5TCfgbmtJyKFDySEk93kTWmuruC2VW53FTgB1MuHm9
	x3dv08/Q==;
Received: from localhost ([::1]:53276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jI7tt-000tUp-4R; Sat, 28 Mar 2020 09:37:09 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43983) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jI7to-000tUi-BU
 for samba-technical@lists.samba.org; Sat, 28 Mar 2020 09:37:06 +0000
Received: by mail-ed1-x536.google.com with SMTP id bd14so14467019edb.10
 for <samba-technical@lists.samba.org>; Sat, 28 Mar 2020 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xuZ75wTBaGg/sJk1KJuzq4y9eLBzq74BrNu9O/Llnok=;
 b=ONmoqYSOn0I6RxpMHfM4QXAd7UGyY/Heu+NBCqbT0XZi4usVLMi7KdcmvgWasetA0F
 HDsP8Ah8iXmwyGgZG/LgHw9tnGgaVI1jFHGsotZND52fUsMti3+m2vlk7wBL7oZAMvBl
 ruWFDTsmv1ocnp266tfd4MRCC4DLmDceHjQ8ardQMWCLhFeiYNNfDnNt7cw64EiOXD4E
 d6BdwgqjxHwB/CVwOBIWMc51+unGtxb54ZIxs6DAHgKT/SnTfBtJdAUFR+x/H+2avejZ
 nyzl34s+HCq0/xYj9PW9jmDdRBJhdGdGdZ1SJZe+SzcVaV0raQv9KVqNW7Eo/xEtlj5z
 W8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xuZ75wTBaGg/sJk1KJuzq4y9eLBzq74BrNu9O/Llnok=;
 b=OyQL3aIjcJCCXlcDLt/IjdSxOfe4wOhElN3H53ZUy85H6/3UyQxnweKxwH6WI2bSQx
 uhBdrP6MewSV0heDN6oHnq/nOZZe924kxRseKb5XhalVaOuebikt9tl9xmLthFtJgrnV
 2/3J9WPP8oVID0WO3JKhVkuQjLcapg3i1I27s2H1JF3J9kaIWCh2uKRzQ2Z/EBROfCY0
 p2O8o76/vG4nf4lvhCxx2ba2PpCoB36Uu2B/WKM8jp7FJVlQR7JwRJ0BrgvrfhA40OH1
 QsEzawIWoydmrDLXfLVDBF08vZ0NtoPpQfrRQWRv+1zL9FeFm4OWlRQxhFqFxYAAQuUy
 1EFg==
X-Gm-Message-State: ANhLgQ3kslhCUgwbUUKY94TKehqxEmIZ0wMN0LGQZwP1D9n38C+slcHX
 bh/9qw2k8huhIgIUsDvsVRBXdb62Hphi/wGbXs+AdatrraI=
X-Google-Smtp-Source: ADFU+vtrn/l1K5Xx/8X10otWxGK2YMbQqWUHXnR2V0ozTEO6NZvX8AK2X2FVHjmtFnEfDj6ZE/6iMLHD94BHAtcowY4=
X-Received: by 2002:a17:906:8405:: with SMTP id
 n5mr2978062ejx.214.1585388223184; 
 Sat, 28 Mar 2020 02:37:03 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 28 Mar 2020 12:32:59 +0300
Message-ID: <CAH72RCVu_qmFy2POqxfWZnZqQRhhiys+nYVtEc2EdYj9YuX_Fw@mail.gmail.com>
Subject: Gsoc: Integrate Samba AD DC deployment and management with Cockpit
 idea
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

Hi, I'm Hezekiah a student interested in working with Samba during Gsoc
period. I've cloned the repo(https://github.com/abbra/cockpit-app-samba-ad) but
the installation steps don't seem to work. Is there a way I can access the
frontend design so that I know how to proceed with my proposal.

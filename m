Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1C921523D
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jul 2020 07:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=cPv4/wExMc//UG7VjX1Mj8DNETQqCXcQNsG+qMgzGx8=; b=QSFMEHDfEsaTNx0wQLw7PMDRvX
	mLzinztp0Y+krzUxu7QzeaFgvOSeUK4Kmnv9Syw4KwE99mFRDv7eu/GBiZ8tb/fJD7Klyd+3JVAyO
	iNNsYEQQ0Fs2VhkFxK9gTr6NiFaENcoSMuvcaO1Xc3o6x1w7jhAUjUDjsIICfEVF5SI2aiu1hJPek
	XEL6zYcMDHy2u5Y9jX7c6f5iF+ywY/zel9HTBh5NxLYwtSD2mv+7EtyuPxUcyRAHaoG+9uYscckqK
	vW5/0ziLq02844a/utnc+tYOEKNZux1pGvXaeFQApwLqQ7z9EBiCdAKY31+dLknrFYmhhXc15OlFm
	4sTw4u5Q==;
Received: from localhost ([::1]:52314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jsJo0-005eaT-41; Mon, 06 Jul 2020 05:36:40 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:44819) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsJnt-005eaM-SE
 for samba-technical@lists.samba.org; Mon, 06 Jul 2020 05:36:36 +0000
Received: by mail-oi1-x231.google.com with SMTP id k6so27242124oij.11
 for <samba-technical@lists.samba.org>; Sun, 05 Jul 2020 22:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wmgW57FX7VTREx2TmFtkQICvNwWB+14zF59vN1GM4tQ=;
 b=Q1ySEwDfnLuAnKWS8Z2S9N8/d8/j6Y0sFiSgXn6tp8YZdIXqM2kxm4fuP+cpc5wTEl
 lrOX0eDDMfd++zojass0qPCtOtzcqYkgHCM0iRuKABI2/moXKq2rOyRDqdNQ88T6zy1g
 jEeEfTY3Ab1QT2HeIg47wrt9R6nYdWy7x+on1jNt5b7uYlWZT5/F3Sz/4myttSNBAy6p
 rj0XjWyUeSdA++bWhxSQ75UlPtkWBA3xrgakIpCyuWzrmAm4k6wi6hwS7iY+o14/58hg
 cLFpvDJCp7KAItt6pH9GQLEGdE/fF7ityAPrHHJW9KQH9Ho6EQ4ZF93yntISy9dD4yZA
 wwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wmgW57FX7VTREx2TmFtkQICvNwWB+14zF59vN1GM4tQ=;
 b=lAEBD52QWOEn8+E36EjEuN6E2pT2GfxHXAqOROSgbjaGfiNIf1+oDFKXgu2mXk1JFL
 KsdFEuaFYtEravPJcQp985IK/FG0288EVCN4pkMesQlloWjFO6VF7n7UjHG79qEtybUr
 sZ62WEd/Sdp5c8a6aUPR+PQUpyGpTAHt2+CgSf9OiAYOYTmx2hb2FJP7q/r2m8T65Dbw
 Ab+HrT4qQIXqCXEmchXwCMzYt4VkmatfIAXgz8A91qkb2wZtTRTa5gablvXzFH3sCtYF
 gMIMAUCbAieK76rN393QvyPZZ+FxcsjIjnRLF0esXe/tdTWhkyqa94B/PgeqZjRrR50B
 RNhQ==
X-Gm-Message-State: AOAM533AQ/Wmvwpyq/OefXkySLTg/sAwPC0H0885mn4mpxpQuTA0iBBa
 UONztpEnZmUhvR2IcnHUsDidiTW2oztwjgQsMaD92Q==
X-Google-Smtp-Source: ABdhPJyuA8BGa+1sobS1YTSs12xXCIQz4PAitun5W+6j1rYSjv2hvjqB8S/jFV2I1DVFV8lwIvJZUzYaQEtK6lVcrO4=
X-Received: by 2002:aca:c70f:: with SMTP id x15mr35702700oif.163.1594013790220; 
 Sun, 05 Jul 2020 22:36:30 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 6 Jul 2020 14:36:19 +0900
Message-ID: <CAJDKJ9XnX6Ni8SEEfHXzW8zVa1PBkaJjbt8=N1F1qN+Ec=Kxmw@mail.gmail.com>
Subject: How can I run server services?
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
From: Jeygon Kim via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeygon Kim <xeros0320@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello.

I've been recently looking into samba source code for studying purposes.

When I run samba binary in the default model, I can see that several
different prefork worker processes are created.

How can I run other tasks such as smbsrv or ldapsrv that are not created by
default?

In source4/smb_server/service_smb.c:96 it says that server_service_smb_init
is called at smbd startup but when I manually add breakpoint to the
function it doesn't stop.

I would appreciate any help.

Thanks.

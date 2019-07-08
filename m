Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44C61F27
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jul 2019 14:58:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=J6hPdok/c2lak0/0xdwvb2il1uT12WQhlPqP13UmfkA=; b=ibZpDis+7vFzYuaa/FxO9WpR+1
	EpOiaPhPLtYSGwAe/nLKtr6EfUUrT2FriUsXpWQGnoMdAOFZOC250KaS73TqMsUpnw/Z/r8pQApm3
	cSVUAXQ01sUasKVhXmu8Z6JnmW/cpu024J+QLihntc1mJGehsR4XV8ZJeLiUFZklTNoXP1jTPttxa
	GaTSJIrTalCflwdn9nb72AlzFIa1igm+aBjRciWZFmqNkxWYedLxIErdBiBTFnhPS/JoQeuracdZf
	oZFJ72DuesRECNXvvEeAgdhVJExZFsS/+nvIExjzOfJCTQrf+1/1bIYNXevRz/1gY9hP6v3PUg0VH
	SVkZvV3A==;
Received: from localhost ([::1]:58388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hkTDO-005rKf-9N; Mon, 08 Jul 2019 12:57:54 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173]:34329) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkTDK-005rKY-IS
 for samba-technical@lists.samba.org; Mon, 08 Jul 2019 12:57:52 +0000
Received: by mail-pf1-f173.google.com with SMTP id b13so2981305pfo.1
 for <samba-technical@lists.samba.org>; Mon, 08 Jul 2019 05:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=J6hPdok/c2lak0/0xdwvb2il1uT12WQhlPqP13UmfkA=;
 b=aeTbM52yf6HiFHtnVVVPGNR/pz7GAf3ufY48lzfuXyN7Q/4rUukerhf5Mcw37oys4U
 tuIItLD6P6ZYcsDioXMriKh86I/4t7w7KI99/vRyGgfRDbYWFFYso+dpKfY6ZJD026Ha
 ZrvflUD3frPWrQgJ+87oztBBuKPJ5MvKup5GE7a04w4ggJXtbd9lpHEXP2hCzdLHBcjt
 7y5bXviU7oudju3cCko2NOpIAw7o4lTq5Vb6acBa3aQP52BSQe5NiMDAty0sYyC7IzxZ
 2IOZKOKeFI++wHmxd8d5v1gWl9Iia21DpD3eZxqOyUmIfAfw8enF1ZDUQzId3eZf1Faa
 8XcQ==
X-Gm-Message-State: APjAAAWyO2yWjmDBzW6cZoCidPWmufhZWI1QbSQ8wrIWtW1Gm4h1n8Fl
 0y8oupcZdieDjRswhbjWACA6wqAv+/I=
X-Google-Smtp-Source: APXvYqzpA1EVT56VBvAy8MhssvV7fuQuywXvdmvXgxNNRouVmVkkVbyE0eRbJfHLqT6MgymK4vULQQ==
X-Received: by 2002:a65:63cd:: with SMTP id n13mr23519463pgv.153.1562590667846; 
 Mon, 08 Jul 2019 05:57:47 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id x67sm18620413pfb.21.2019.07.08.05.57.45
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 05:57:47 -0700 (PDT)
Subject: modules_path(talloc_tos(),SAMBA_SUBSYSTEM_GPEXT) returns
 '/usr/local/samba/lib/gpext' which does not exist
To: samba-technical@lists.samba.org
Message-ID: <6f866de3-5ece-f876-349e-7ecc0c69bb06@redhat.com>
Date: Mon, 8 Jul 2019 18:27:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

While I was looking at source for:

# /usr/local/samba/bin/net ads gpo apply <username> <client-side-extension>

These are steps followed:
                argv[0]=AD-User-name, argv[1]=Client-Side-Extension
                Step-1: Retrieve GUID of CSE using
cse_gpo_name_to_guid_string [filter=GUID_of_CSE] -> OK
                Step-2: ads_startup() ->  OK
                Step-3: ads_find_samaccount(argv[0], &uac, &dn) Finds
dn, userAccessControl value for username entered -> OK
                Step-4: ads_get_gpo_list(dn, token, &gpo_list) retrieves
gpo_list on basis of dn,token. [gpo_list=GPOs_of_dn] -> OK
                Step-5: gpo_process_gpo_list(token, gpo_list, filter)
                    5a: gp_init_reg_ctx(KEY_HKCU,
REG_KEY_WRITE,token,**reg_ctx); [Get values filled in struct
gp_registry_context] -> OK
                    5b:
gpext_process_extension(token,flags,root_key,filter,gpo_list)
                        5b1: gpext_init_gp_extensions(mem_ctx)
                             5b1-1: gp_glob_ext_list() it calls
'modules_path(talloc_tos(),SAMBA_SUBSYSTEM_GPEXT)'

libgpo/gpext/gpext.c
modules_path(talloc_tos(),SAMBA_SUBSYSTEM_GPEXT)  returns
'/usr/local/samba/lib/gpext' which does not exist

Queries:
1. Where is definition modules_path()?
2. Is path returned by modules_path() is correct?
3. Shouldn't we provide 2nd argument to 'net ads gpo apply
<user|machine-dn> <gpo>' as new GPO to be applied to user or machine
account?
 -> why client side extension's GUID need to be provided?

Thanks
Amit



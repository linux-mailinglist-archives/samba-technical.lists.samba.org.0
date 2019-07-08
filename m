Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC661FA8
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jul 2019 15:40:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=dOZ27W2bBINOD+lRwqu5dq12W9CvUPR0H42XS84WscM=; b=XzxYqVb97N2tCSwrOe8BFpbvgT
	j0Xyf04nBbdOpljiYiWATjMwPxI7RExKHMmeFQTDgZqj1QTR+AMGJhQbgEn+xezWkjCnm97DyxbLd
	Q606iVGp5URljJNbGgubc/nGK0JnftzRxJ6MI1cLN4+l2VDhdE+Nk98xmMc1W/UAhxYxbYuyQoqzn
	4EQt3lfdc7Ntv2KJKoFPCinvDVA7Tbz9vxfUD52HydfA2VFjuVrJHhMeCichwQ5/a8PMGLaeW0aN6
	MnSQMABGPE8P/B2tESrHhNNW71o3lMX9qxPEZuv5lXPP+JdwDS+vDmXhs41Ajle5Cr6ciVGLPoOes
	qWrH6uMw==;
Received: from localhost ([::1]:59414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hkTsT-005rXv-L3; Mon, 08 Jul 2019 13:40:21 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180]:34047) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkTsO-005rXo-6X
 for samba-technical@lists.samba.org; Mon, 08 Jul 2019 13:40:19 +0000
Received: by mail-pf1-f180.google.com with SMTP id b13so3041189pfo.1
 for <samba-technical@lists.samba.org>; Mon, 08 Jul 2019 06:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dOZ27W2bBINOD+lRwqu5dq12W9CvUPR0H42XS84WscM=;
 b=hfYc18BV7XNhAf8XrEPU80hCGE7511cxmV8mEazeUo5PZavTXsl6BAucBf8E1bMAHr
 mb9ZPmE2yim6jYs4FqMeYP0quBbKvd8xTui+X+Tc57H81ia4YCvhSIM5kZJm3x3i/sh9
 +bLJTdsszUjsukp+obwNdD/4QGCIjLBQAXVygHK4tw0hhba54mxfpLlh1xxczIhGsOTx
 4jy5Ij9yv7gt72gO42JcdYGAT1Xy5TxC8d2KDh+3O1ijOE3SlkJxNavz+054XnIW0B7D
 Z3DmL9zDgnFH1dVvXx6xUAx4MkU+zF+8lpBTHx1HEjRiULzMYe3zv2Nji9SztvsgxHZ4
 7Iww==
X-Gm-Message-State: APjAAAUL/ApmRSXaTSDRi211PoTW3dPpq58UOxESx3iZKUN2ESc84yPQ
 QUdEXFs/p/6nTntGb2F6NbcuUNDTO8I=
X-Google-Smtp-Source: APXvYqxRmuhVfy5ahrKBjfkY4VU3/mcAqUykELaSfXR+mHZmK2LFeFp8adfM3EZg0TfmILjQeDArRw==
X-Received: by 2002:a63:2326:: with SMTP id j38mr24334615pgj.134.1562593213688; 
 Mon, 08 Jul 2019 06:40:13 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id o130sm44589154pfg.171.2019.07.08.06.40.12
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 06:40:12 -0700 (PDT)
Subject: Re: modules_path(talloc_tos(),SAMBA_SUBSYSTEM_GPEXT) returns
 '/usr/local/samba/lib/gpext' which does not exist
To: samba-technical@lists.samba.org
References: <6f866de3-5ece-f876-349e-7ecc0c69bb06@redhat.com>
Message-ID: <4bb80af2-6240-4bbf-7749-9cfce2499d53@redhat.com>
Date: Mon, 8 Jul 2019 19:10:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <6f866de3-5ece-f876-349e-7ecc0c69bb06@redhat.com>
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
char *modules_path(TALLOC_CTX *mem_ctx, const char *name)
{
        return talloc_asprintf(mem_ctx, "%s/%s", get_dyn_MODULESDIR(),
name);
}

get_dyn_MODULESDIR()?
# vim ./buildtools/wafsamba/wscript
    opt.add_option('--with-modulesdir',
                   help=("modules directory [PREFIX/modules]"),
                   action="store", dest='MODULESDIR',
default='${PREFIX}/modules')

# make show_waf_options
   --with-modulesdir=MODULESDIR
    --with-pammodulesdir=PAMMODULESDIR

if i provide /usr/local/samba/lib/private/ then also gpext inside it
does not exist!

Thanks
Amit

On 07/08/2019 06:27 PM, Amit Kumar wrote:
> Hello,
>
> While I was looking at source for:
>
> # /usr/local/samba/bin/net ads gpo apply <username> <client-side-extension>
>
> These are steps followed:
>                 argv[0]=AD-User-name, argv[1]=Client-Side-Extension
>                 Step-1: Retrieve GUID of CSE using
> cse_gpo_name_to_guid_string [filter=GUID_of_CSE] -> OK
>                 Step-2: ads_startup() ->  OK
>                 Step-3: ads_find_samaccount(argv[0], &uac, &dn) Finds
> dn, userAccessControl value for username entered -> OK
>                 Step-4: ads_get_gpo_list(dn, token, &gpo_list) retrieves
> gpo_list on basis of dn,token. [gpo_list=GPOs_of_dn] -> OK
>                 Step-5: gpo_process_gpo_list(token, gpo_list, filter)
>                     5a: gp_init_reg_ctx(KEY_HKCU,
> REG_KEY_WRITE,token,**reg_ctx); [Get values filled in struct
> gp_registry_context] -> OK
>                     5b:
> gpext_process_extension(token,flags,root_key,filter,gpo_list)
>                         5b1: gpext_init_gp_extensions(mem_ctx)
>                              5b1-1: gp_glob_ext_list() it calls
> 'modules_path(talloc_tos(),SAMBA_SUBSYSTEM_GPEXT)'
>
> libgpo/gpext/gpext.c
> modules_path(talloc_tos(),SAMBA_SUBSYSTEM_GPEXT)  returns
> '/usr/local/samba/lib/gpext' which does not exist
>
> Queries:
> 1. Where is definition modules_path()?
> 2. Is path returned by modules_path() is correct?
> 3. Shouldn't we provide 2nd argument to 'net ads gpo apply
> <user|machine-dn> <gpo>' as new GPO to be applied to user or machine
> account?
>  -> why client side extension's GUID need to be provided?
>
> Thanks
> Amit
>



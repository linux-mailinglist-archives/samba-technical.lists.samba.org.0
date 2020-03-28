Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E050E19698B
	for <lists+samba-technical@lfdr.de>; Sat, 28 Mar 2020 22:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hprHqV2j/H/0N6PkWlp9iuUQpAjbLW8J5rQjHrH8ZwI=; b=BvmtlTp5j8IcaNz1q/2SC5fBrW
	Auw+UHJjATkfVKx0KMtt0t807NGMQwX2BL/QpQ5Y21s47Fx/4872uyXA2NES96N3wWw3tciHEUSW/
	ojLR++himWoNRqCDK5PnpH7b9HiHZkRnG0Ig04w+esZ2XGUuIjzEAvbqkXAyEC0oSHEiQuOcNT6NH
	hHS/MlWhfJgLl0Js0l+3Oaute4adokj4pYTXfeUvRuyoqL9vCRymZDnBAiMqJuTamRpe2vWg+qcbw
	Xr2PHsdMA9lmpHbpIZEkOJDshNGQMo4PHZ4zjZPhr7mqtILjL77LdArc1tOx/9nMmZUGTbHqqxUCT
	u/QE2G6w==;
Received: from localhost ([::1]:61434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jIJCh-000vSA-AX; Sat, 28 Mar 2020 21:41:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58756) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jIJCc-000vS3-Pu
 for samba-technical@lists.samba.org; Sat, 28 Mar 2020 21:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=hprHqV2j/H/0N6PkWlp9iuUQpAjbLW8J5rQjHrH8ZwI=; b=n76QyovdCFq1wqcMe94aIsBwUH
 zQrLPguF24aS4MdUJuXnzS4gwH2pGy8KRnpblfBnlokz5R/cwSTf7v7zDUktTosAq8pHqHnc2q3wZ
 dotw7H6jba7K80DA4/U4bBEPEhC9ke7bg+f112Pr9pDoJ/CvMNjwXCwlnThi59VubORwN2c2HxUEP
 qnrr6PRPzeIzp6uZ47pY67nbe+NlSp3GXVkzZTaizZt+cCGy5MiIQ9AFkiH14W4cCDfgyUCovmhyB
 DjtmWpC4h3XVIpkEkbXdnGqhlMWu+OkSzuejkkJjPmfuROJlSrnAGX9mFh6lJmWVsXmRQoER/Ufud
 rm1LZg4Nzt9u7Zyt4e2vmUTQjhOLOKYPgSB69moddPY82CfuSFChsnZBawwhMS/m1A3dcXn7l2k+b
 QjPPz/jEtxiCaJu1Mczp4AhlSAz3746loSPGLje05f6a/hkszBrjQi7F1AHed2RlgnYDV9lf5fJM9
 QXtbVP1lhMLOIizODVzBZh3q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jIJCb-000846-CF; Sat, 28 Mar 2020 21:41:13 +0000
Date: Sat, 28 Mar 2020 23:41:10 +0200
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: Gsoc: Integrate Samba AD DC deployment and management with
 Cockpit idea
Message-ID: <20200328214110.GU2735275@onega.vda.li>
References: <CAH72RCVu_qmFy2POqxfWZnZqQRhhiys+nYVtEc2EdYj9YuX_Fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCVu_qmFy2POqxfWZnZqQRhhiys+nYVtEc2EdYj9YuX_Fw@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Hezekiah,

On la, 28 maalis 2020, hezekiah maina via samba-technical wrote:
> Hi, I'm Hezekiah a student interested in working with Samba during Gsoc
> period. I've cloned the repo(https://github.com/abbra/cockpit-app-samba-ad) but
> the installation steps don't seem to work. Is there a way I can access the
> frontend design so that I know how to proceed with my proposal.

The code you see in my github repo was a prototype to assess how far can
we get within a day of experiment. If we would start from scratch (most
likely) then I'd suggest you to look at several things:

- cockpit-design, as they provide a good researched UX and UI designs
  for Cockpit apps for multiple areas over past few years,
  https://github.com/cockpit-project/cockpit-design/
- SuSE YaST work around https://github.com/yast?q=samba
  (see
  https://sambaxp.org/fileadmin/user_upload/sambaxp2019-slides/mulder_sambaxp2019_samba_active_adrectory_tools_windows_admin.pdf
  for some details)
- Cockpit starter kit, https://github.com/cockpit-project/starter-kit
- 389-ds Cockpit plugin, https://pagure.io/389-ds-base/blob/master/f/src/cockpit/389-console
- Cockpit virtual machines interfaces (both cockpit-docker and
  cockpit-podman), see more https://github.com/cockpit-project

The project would need to investigate:

- a possible UX and UI design

- define base set of use cases that can be mapped to distinct Samba AD
  as covered in
  https://wiki.samba.org/index.php/Setting_up_Samba_as_an_Active_Directory_Domain_Controller,
  https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Domain_Member,
  https://wiki.samba.org/index.php/Joining_a_Samba_DC_to_an_Existing_Active_Directory,
  and other domain controller related tasks as described in https://wiki.samba.org/index.php/User_Documentation

- build actual Cockpit app that implements a clearly defined subset of
  those use cases.

From my perspective, a successful project proposal would be able to
present a set of use cases proposed to focus on since this is a huge
area, a scope to work on, how one would expect to work on deliverables,
technology and process wise.

It would be nice to see how this project would evolve after the GSoC session
would end, since it is clearly a longer term work that would need to be
passed over and shared with more contributors.

-- 
/ Alexander Bokovoy


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8E683C575
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jan 2024 15:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=lBRZyOZUjvpCOBVjE9ZJLjjZR9YCgBBQ132Niy/+TO8=; b=OmvGDjynBTTn7niwaZAHegNBVO
	pPrv7bDFFqStWaEKXAwFtqPWQIS/Wz0QIbvFTkWDOlBsrRA/cEngP8jJ2hpvVJkutW39oIICvBgfA
	02z0nEcEw1cG/iLRCxi3ql7LSqrCGpzOK1cUiL3onw5AG+OkMxf3KfaZ7Jmkbe5Hj+fiKTbVWXTiZ
	Izs/F9A242/FCYYp2ux/MEmzUh3DSezVrjs9GLaLqR0qD2jfCgupJju/VU59xHfgChC90zI0EioV/
	Dt/qY+C07ZIEbthpSVXhnmWWHcaWpyQh2ISx/EYt+yV+7dKPZqQiFep35sOM9NWgXEkUnexZSFhDu
	Vj5odNGA==;
Received: from ip6-localhost ([::1]:52660 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rT15z-004RZd-V1; Thu, 25 Jan 2024 14:52:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46828) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rT15u-004RZV-M3
 for samba-technical@lists.samba.org; Thu, 25 Jan 2024 14:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=lBRZyOZUjvpCOBVjE9ZJLjjZR9YCgBBQ132Niy/+TO8=; b=nkrcJYNMXEvmWSApmH9bA0b+9P
 hguiEXrqVSpZiu6P6VpKH3Co8PPX5gZcllHMB8tMhYbVmj+vfPHJ6aC5bEPms8clCLgC7oLBks2/m
 uvXX5IM9L05GgFgLpUzhuPBIRIacIsWw5zFpUy9LTtYODliaaoHjB8FcihgUaHMpQhtuTYFjOrYYN
 IeB6AHmoJZqkeNozgsA/Pnha/CSnbcB5aYof3rt78TLoW2RcVkn9wOkEL5o2Vler4WuOBfqRlo+2g
 5bpm81G+dZtfxk7O3pgn1OMJse8qOUhJCR79kgUKZxnNCMIBjDB71KZhQzeVWIBpqkEMAFcTphVJe
 9HBPWksFyvG5c1ewSJw4wIe9Eae6/z+nD1XEG3uQ/3PUflSTOjmHJpRqkmhKvZ3lrwYYehj5e8HxJ
 PJS0LT/EvlB7odzIqnoS4W+QwoJReY4RDd5csiBUcJajGGQ518CTMfx+prAmvpi8jpg4/XgCIdP7G
 GXd7q15NLiqrtLhr5sY4srbt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rT15t-009k3S-2u; Thu, 25 Jan 2024 14:52:42 +0000
Date: Thu, 25 Jan 2024 16:52:36 +0200
To: hhyy ww <hywusmb@gmail.com>
Subject: Re: Order of getpwnam call in Get_Pwnam_internals
Message-ID: <ZbJ1tOmGBp7OwXgt@toolbox>
References: <CAPSN9iQ1GJAU1oQTpK2k+z968X71NuO_932QgRPcWS55imdb7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPSN9iQ1GJAU1oQTpK2k+z968X71NuO_932QgRPcWS55imdb7A@mail.gmail.com>
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

On Чцв, 25 сту 2024, hhyy ww via samba-technical wrote:
> Hi List,
> 
> I have a question about this commit
> https://git.samba.org/?p=samba.git;a=commitdiff;h=ea4a0d509ef70e91baedc5eebf4f4bcff10dac96
> 
> Why samba change the the order of getpwnam call from
> origin->lowercase->uppercase to lowercase->origin->uppercase?
> 
> Without this commit, what kind of problem will heppen?

In a POSIX environment usernames are in case-sensitive. On
Windows side names are not case-sensitive. RPC calls from
Windows systems would pass in a name as it was entered by a user and
that needs some normalization to be able to match it since POSIX API has
no way to search case-insensitive. Typical POSIX (Linux) environments
have names in low case, thus the code tries to optimize at source for
most common use case.

-- 
/ Alexander Bokovoy


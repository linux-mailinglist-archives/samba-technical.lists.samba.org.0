Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB119EA675
	for <lists+samba-technical@lfdr.de>; Tue, 10 Dec 2024 04:17:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=a+3UNZ2Nos7GwTeV0stOOopWGRR/YeQzZEUwVuMASqk=; b=6Mp3UtbO0DHnIYZ7Emu4z72noC
	Y/oSlIJm+CJ9MGbxEFllURiuoB9TXPvULnYvSNbNBH80up51r3g5f4wczjPclMds3v5qonQ2s1ECE
	wbGwyJ6aRFXml6faMA5IOrQDaIdFKsuRlHQiEYQ3s2S/PI/uvnnkZW639FITzotC+v3uTOCdJv4YB
	GqM1VIxCEjrO5gM2ohHBdwQxUWzlAidm/NdSxzWl6tkeVqPMjzOhya1GH/V4t9DBelCOdsuMkoD4a
	ZDEnj1hHfFA6ASItHNFhdOiluCvV7viyTb0jSQmTav52PIg6knqqYjqbb4mrtrKRQXqykMO7kTh6i
	ucLyChfA==;
Received: from ip6-localhost ([::1]:24150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tKqkH-003nyG-5E; Tue, 10 Dec 2024 03:17:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30740) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tKqkA-003nxp-Ku; Tue, 10 Dec 2024 03:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=a+3UNZ2Nos7GwTeV0stOOopWGRR/YeQzZEUwVuMASqk=; b=aSfh0p+/OkCT1oXmVXMT5MPuYV
 iROT/MJ24Cb2zKOk+BVaazWNMADGuiOMPhVgiSDxulb80fmPde0p/FzG3JtZwk9RsUNxhly3pUBl3
 NI3pZMI8fcWcpQadzZjgk3Fa/YdOa0YfY/0BYmrcxQru2KPvw5KusszNizeYzIVfiGQ8taJBlOato
 ML9ib8XYgAObM9Z0l4RquRig+TrzuzZage9Av2JEBe+wnE+pYdmbxrQ9eu4B5+/X4arRp+6rxWk4x
 1583en8j2dnZT/DBWejlBLlWFVI2GlbxxLAsTboaiM16gbJtEZ9Ren7HBt4a7dL8a1B8g4hFkK6zT
 scbISvx+NVut6kZaO+uwIldU96bOoDr83kjMd8jQVbXzlT+oF2uoxRioeY9QkcbACkTuRdU99HhOs
 BlRjjaQYhUhvCPBfYleY7PrJMpgptUCUTCAOmxPi4Qk1pHouAjto94HGXm9iYV0URoMZD6r6pR+No
 OpXW+CnLARYgVQp8mHPSTVxZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tKqk9-001njG-0t; Tue, 10 Dec 2024 03:17:01 +0000
Date: Tue, 10 Dec 2024 14:16:53 +1100
To: Peter Koch <sambamailinglist@gmail.com>
Subject: Re: [Samba] TOO MANY OPEN FILES when adding printer driver
Message-ID: <20241210141653.1d1269da.ddiss@samba.org>
In-Reply-To: <CAPcm_1wHWy7JBznag7n984M6MwHA2HxGk3a6O1bWKqi_1dBFog@mail.gmail.com>
References: <CAPcm_1xbTu5udHnxEADw8Es_eBbMTBS3EAKUm4ow06zNLd_UrA@mail.gmail.com>
 <CAPcm_1wHWy7JBznag7n984M6MwHA2HxGk3a6O1bWKqi_1dBFog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: samba@lists.samba.org, Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

[cc'ing samba-technical list]

Hi Peter,

On Sun, 8 Dec 2024 21:33:53 +0100, Peter Koch via samba wrote:

> Dear Samba experts,
> 
> I have 10 rpcd_spoolss processes running. Here's the
> output o prlimit for one of them:
> 
> # prlimit -p628
...
> NOFILE     max number of open files                 270     16384 files
...
> NOFILE has a soft limit of 270 - seems very low to me.
> 
> I changed the NOFILE-value for all of my rpcd_spoolss-processes:
> 
> # prlimit -n500:16384 -p<pid>
> 
> And this fixed my problem.

Thanks a lot for your report and follow-up.
smbd and winbindd already attempt to manually set RLIMIT_NOFILE limits
based on configuration of "max open files" and "winbind max domain
connections" respectively. I think it'd make sense to also attempt to
raise the limit for Samba rpc daemons.
Would you be able to raise a bugzilla.samba.org ticket for this? That
should ensure that we don't forget about it.

Cheers, David


> 
> Kind regards
> 
> Peter
> 
> Am So., 8. Dez. 2024 um 19:30 Uhr schrieb Peter Koch
> <sambamailinglist@gmail.com>:
> 
> > Dear Samba experts,
> >
> > I'm trying to add a printer driver for a Canaon TM-255 plotter
> > to out samba4 machine.
> >
> > While most printer drivers consist of a handful of files, this plotter
> > requires 149 driver files.
> >
> > I'm adding the driver via:
> >
> > FILES="CNWT10GM.UPD,,CNWUO411.DLL,.... 142 more files"
> > rpcclient -U Administrator%nav852 SERV00 -c "adddriver \"Windows x64\"
> > \"Canon TM-255:CNWUOM.DLL:CNWT10GM.XPD:CNWUOMUI.DLL:NULL:NULL:$FILES\""
> >
> > And this fails with WERR_APP_INIT_FAILURE
> >
> > If I reduce the list of extra files to 116 files everything works fine.
> > If the list of extra files has >=117 files the following messages
> > show up in /var/samba/log.rpcd_spoolss
> >
> > [2024/12/08 19:25:42.072125,  0]
> > ../../source3/printing/nt_printing.c:1482(move_driver_file_to_download_area)
> >   move_driver_file_to_download_area: Unable to rename
> > [x64/CPC1RUW1.DLL] to [x64/3/CPC1RUW1.DLL]:
> > NT_STATUS_TOO_MANY_OPENED_FILES
> > [2024/12/08 19:25:42.073567,  0]
> > ../../source3/rpc_server/spoolss/srv_spoolss_nt.c:8716(_spoolss_AddPrinterDriverEx)
> >   _spoolss_AddPrinterDriverEx: move_driver_to_download_area failed -
> > WERR_APP_INIT_FAILURE
> >
> > How do I increase the max number of open files for rpcd_spoolss
> >
> > Kind regards
> >
> > Peter  
> 


